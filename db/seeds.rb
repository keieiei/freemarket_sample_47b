# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/seeds/csv/brand.csv', headers: true) do |row|
  Brand.create(
    id: row['id'],
    name: row['name'],
    brand_category_id: row['brand_category_id']
  )
end

CSV.foreach('db/seeds/csv/large_category.csv', headers: true) do |row|
  LargeCategory.create(
    id: row['id'],
    name: row['name'],
    order_number: row['order_number']
  )
end

CSV.foreach('db/seeds/csv/middle_category.csv', headers: true) do |row|
  MiddleCategory.create(
    id: row['id'],
    name: row['name'],
    large_category_id: row['large_category_id'],
    order_number: row['order_number']
  )
end

CSV.foreach('db/seeds/csv/small_category.csv', headers: true) do |row|
  SmallCategory.create(
    id: row['id'],
    name: row['name'],
    middle_category_id: row['middle_category_id'],
    order_number: row['order_number']
  )
end
