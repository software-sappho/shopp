class Cart < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def add_product(product)
    item = line_items.find_or_initialize_by(product: product)
    item.quantity = item.persisted? ? item.quantity + 1 : 1
    item
  end

  def total_price
    line_items.includes(:product).sum do |line_item|
      line_item.quantity * line_item.product.price.to_d
    end
  end
end
