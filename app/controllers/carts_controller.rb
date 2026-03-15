class CartsController < ApplicationController
  def show
  end

  def empty
    @cart.line_items.destroy_all
    redirect_to root_path, notice: "Your cart is now empty."
  end
end
