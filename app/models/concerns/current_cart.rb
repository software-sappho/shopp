module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    if current_user
      @cart = current_user.cart || current_user.create_cart
      merge_session_cart_into_user_cart
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def merge_session_cart_into_user_cart
    return if session[:cart_id].blank?

    session_cart = Cart.find_by(id: session[:cart_id])
    return if session_cart.nil? || session_cart.id == @cart.id
    return if session_cart.user.present? && session_cart.user != current_user

    session_cart.line_items.find_each do |line_item|
      current_item = @cart.line_items.find_or_initialize_by(product_id: line_item.product_id)
      if current_item.persisted?
        current_item.quantity += line_item.quantity
      else
        current_item.quantity = line_item.quantity
      end
      current_item.save!
    end

    session_cart.destroy
  end
end
