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
require "csv"

Product.destroy_all
Category.destroy_all

# Generate products with Faker
# 676.times do
#   product_title = Faker::Food.dish
#   product_price = Faker::Commerce.price
#   product_stock_quantity = Faker::Number.within(range: 0..100)

#   new_product = Product.new(title: product_title, price: product_price, stock_quantity: product_stock_quantity)

#   if new_product.save
#     puts "Product created successfully!"
#   else
#     puts "Error creating product: #{product.errors.full_messages}"
#   end
# end


# Populate products with CSV
csv_file = Rails.root.join('db/products.csv')
   csv_data = File.read(csv_file)

   products = CSV.parse(csv_data, headers: true)

   # If CSV was created by Excel in Windows you may also need to set an encoding type:
   # products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

   products.first(10).each do |product|
    category_name = product['category']
    category = Category.find_or_create_by(name: category_name)

    Product.create(
      title: product['name'],
      price: product['price'].to_f,
      description: product['description'],
      stock_quantity: product['stock quantity'].to_i,
      category: category
    )
   end
