module ProductsHelper
  def product_author(product)
    return "Unknown" if product.user.nil?

    name = product.user.name.to_s.strip
    name.empty? ? "Unknown" : name
  end
end
