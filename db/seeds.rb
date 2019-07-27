# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# CSV.foreach('db/seeds/csv/size_type.csv', headers: true) do |row|
#   SizeType.create(
#     id: row['id'],
#     name: row['name']
#   )
# end

# CSV.foreach('db/seeds/csv/item_size.csv', headers: true) do |row|
#   ItemSize.create(
#     id: row['id'],
#     size: row['size'],
#     size_type_id: row['size_type_id']
#   )
# end

# CSV.foreach('db/seeds/csv/brand_upper_category.csv', headers: true) do |row|
#   BrandUpperCategory.create(
#     id: row['id'],
#     name: row['name']
#   )
# end

# CSV.foreach('db/seeds/csv/brand.csv', headers: true) do |row|
#   Brand.create(
#     id: row['id'],
#     name: row['name'],
#     brand_upper_category_id: row['brand_upper_category_id']
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
#     order_number: row['order_number'],
#     brand_upper_category_id: row['brand_upper_category_id'],
#     size_type_id: row['size_type_id']
#   )
# end

# CSV.foreach('db/seeds/csv/small_category.csv', headers: true) do |row|
#   SmallCategory.create(
#     id: row['id'],
#     name: row['name'],
#     middle_category_id: row['middle_category_id'],
#     order_number: row['order_number'],
#     brand_upper_category_id: row['brand_upper_category_id'],
#     size_type_id: row['size_type_id']
#   )
# end

# CSV.foreach('db/seeds/csv/test_user.csv', headers: true) do |row|
#   User.create(
#     id: row['id'],
#     email: row['email'],
#     password: row['password'],
#     nickname: row['nickname'],
#     birth_year: row['birth_year'],
#     birth_month: row['birth_month'],
#     birth_day: row['birth_day'],
#     family_name: row['family_name'],
#     first_name: row['first_name'],
#     family_name_kana: row['family_name_kana'],
#     first_name_kana: row['first_name_kana'],
#     phone_number: row['phone_number']
#   )
# end

# CSV.foreach('db/seeds/csv/receiver_information.csv', headers: true) do |row|
#   ReceiverInformation.create(
#     id: row['id'],
#     user_id: row['user_id'],
#     family_name: row['family_name'],
#     first_name: row['first_name'],
#     family_name_kana: row['family_name_kana'],
#     first_name_kana: row['first_name_kana'],
#     postal_code: row['postal_code'],
#     city: row['city'],
#     street: row['street'],
#     phone_number: row['phone_number'].to_s
#   )
# end

# CSV.foreach('db/seeds/csv/credit_card.csv', headers: true) do |row|
#   CreditCard.create(
#     id: row['id'],
#     user_id: row['user_id'],
#     card_number: row['card_number'].to_s,
#     valid_year: row['valid_year'].to_s,
#     valid_month: row['valid_month'].to_s,
#     security_code: row['security_code'].to_s
#   )
# end

# CSV.foreach('db/seeds/csv/test_item.csv', headers: true) do |row|
#   num = row['id'].to_i - 100
#   Item.create!(
#     id: row['id'],
#     name: row['name'],
#     detail: row['detail'],
#     item_size_id: row['item_size_id'],
#     delivery_charge_id: row['delivery_charge_id'],
#     prefecture_id: row['prefecture_id'],
#     delivery_time_id: row['delivery_time_id'],
#     delivery_way_id: row['delivery_way_id'],
#     price: row['price'],
#     item_condition_id: row['item_condition_id'],
#     item_state_id: row['item_state_id'],
#     large_category_id: row['large_category_id'],
#     middle_category_id: row['middle_category_id'],
#     small_category_id: row['small_category_id'],
#     brand_id: row['brand_id'],
#     seller_id: row['seller_id'],
#     buyer_id: row['buyer_id'],
#     images_attributes: [
#       { 
#         image: File.open("./app/assets/images/test_images/item_#{num}.jpg")
#       }
#     ]
#   )
# end

# CSV.foreach('db/seeds/csv/test_item.csv', headers: true) do |row|
#   num = row['id'].to_i - 100
#   if num == 1
#     (2..10).each do |i|
#       Image.create(
#         item_id: row['id'],
#         image: File.open("./app/assets/images/test_images/item_#{num}_#{i}.jpg")
#       )
#     end
#   end
# end

# CSV.foreach('db/seeds/csv/test_item.csv', headers: true) do |row|
#   brand_id = row['brand_id']
#   small_category_id = row['small_category_id']
#   middle_category_id = row['middle_category_id']
#   unless brand_id.nil? || small_category_id.nil?
#     if BrandSmallCategory.where(brand_id: brand_id).where(small_category_id: small_category_id).empty?
#       BrandSmallCategory.create!(
#         small_category_id: row['small_category_id'],
#         brand_id: row['brand_id']
#       )
#     end
#   else
#     unless brand_id.nil? || middle_category_id.nil? || !BrandMiddleCategory.where(brand_id: brand_id).where(middle_category_id: middle_category_id).empty?
#       BrandMiddleCategory.create!(
#         middle_category_id: row['middle_category_id'],
#         brand_id: row['brand_id']
#       )
#     end
#   end
# end


CSV.foreach('db/seeds/csv/brand.csv', headers: true) do |row|
  BrandBrandUpperCategory.create(
    brand_id: row['id'],
    brand_upper_category_id: row['brand_upper_category_id']
  )
end