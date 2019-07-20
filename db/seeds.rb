# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# CSV.foreach('db/seeds/csv/brand.csv', headers: true) do |row|
#   Brand.create(
#     id: row['id'],
#     name: row['name'],
#     brand_category_id: row['brand_category_id']
#   )
# end

# CSV.foreach('db/seeds/csv/large_category.csv', headers: true) do |row|
#   LargeCategory.create(
#     id: row['id'],
#     name: row['name'],
#     order_number: row['order_number']
#   )
# end

# CSV.foreach('db/seeds/csv/middle_category.csv', headers: true) do |row|
#   MiddleCategory.create(
#     id: row['id'],
#     name: row['name'],
#     large_category_id: row['large_category_id'],
#     order_number: row['order_number']
#   )
# end

# CSV.foreach('db/seeds/csv/small_category.csv', headers: true) do |row|
#   SmallCategory.create(
#     id: row['id'],
#     name: row['name'],
#     middle_category_id: row['middle_category_id'],
#     order_number: row['order_number']
#   )
# end

CSV.foreach('db/seeds/csv/test_user.csv', headers: true) do |row|
    User.create(
      id: row['id'],
      email: row['email'],
      password: row['password'],
      nickname: row['nickname'],
      birth_year: row['birth_year'],
      birth_month: row['birth_month'],
      birth_day: row['birth_day'],
      family_name: row['family_name'],
      first_name: row['first_name'],
      family_name_kana: row['family_name_kana'],
      first_name_kana: row['first_name_kana'],
      phone_number: row['phone_number']
    )
  end
  
  CSV.foreach('db/seeds/csv/test_item.csv', headers: true) do |row|
    num = row['id'].to_i - 100
    Item.create(
      id: row['id'].to_i,
      name: row['name'],
      detail: row['detail'],
      item_size_id: row['item_size_id'].to_i,
      delivery_charge_id: row['delivery_charge_id'].to_i,
      prefecture_id: row['prefecture_id'].to_i,
      delivery_time_id: row['delivery_time_id'].to_i,
      delivery_way_id: row['delivery_way_id'].to_i,
      price: row['price'].to_i,
      item_condition_id: row['item_condition_id'].to_i,
      item_state_id: row['item_state_id'].to_i,
      large_category_id: row['large_category_id'].to_i,
      middle_category_id: row['middle_category_id'].to_i,
      small_category_id: row['small_category_id'],
      brand_id: row['brand_id'],
      seller_id: row['seller_id'].to_i,
      buyer_id: row['buyer_id'],
      images_attributes: [
        { 
          image: File.open("./app/assets/images/test_images/item_#{num}.jpg")
        }
      ]
    )
  end
  
  CSV.foreach('db/seeds/csv/test_item.csv', headers: true) do |row|
    num = row['id'].to_i - 100
    if num == 1
      (2..10).each do |i|
        Image.create(
          item_id: row['id'].to_i,
          image: File.open("./app/assets/images/test_images/item_#{num}_#{i}.jpg")
        )
      end
    end
  end
