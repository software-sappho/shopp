class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])

    @cart ||= Cart.create
    session[:cart_id] = @cart.id

    line_item = @cart.add_product(product)

    if line_item.save
      redirect_to products_path, notice: "Added to your cart"
    else
      redirect_to products_path, alert: "Unable to add this product to your cart."
    end
  end

  def destroy
    line_item = @cart.line_items.find(params[:id])
    if line_item.quantity > 1
      line_item.decrement!(:quantity)
    else
      line_item.destroy
    end

    redirect_to cart_path, notice: "Removed from your cart"
  end
end
