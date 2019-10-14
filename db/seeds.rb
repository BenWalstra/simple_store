# frozen_string_literal: true

Product.destroy_all

676.times do
  Product.create(
    title: Faker::Commerce.unique.product_name,
    price: Faker::Commerce.price,
    stock_quantity: Faker::Number.within(range: 10..1000)
  )
end

puts "Generated #{Product.count} appointments"
