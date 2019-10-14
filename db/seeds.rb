# frozen_string_literal: true

Product.destroy_all
Category.destroy_all
csv_file = Rails.root + 'db/products.csv'

options = { file_encoding: 'iso-8859-1' }
products = SmarterCSV.process(csv_file)

products.each do |product|
  category = Category.find_or_create_by(name: product[:category])

  category.products.build(
    title: product[:name],
    description: product[:description],
    price: product[:price],
    stock_quantity: product[:stock_quantity]
  ).save
end

# 676.times do
#   Product.create(
#     title: Faker::Commerce.unique.product_name,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.within(range: 10..1000)
#   )
# end

puts "Generated #{Product.count} Products"
