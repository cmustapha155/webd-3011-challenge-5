# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

676.times do
  product_title = Faker::Food.dish
  product_price = Faker::Commerce.price
  product_stock_quantity = Faker::Number.within(range: 0..100)

  new_product = Product.new(title: product_title, price: product_price, stock_quantity: product_stock_quantity)

  if new_product.save
    puts "Product created successfully!"
  else
    puts "Error creating product: #{product.errors.full_messages}"
  end
end