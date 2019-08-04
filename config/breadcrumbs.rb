crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :users_edit_profile do
  link "プロフィール", users_edit_profile_path
  parent :users
end

crumb :users_identification do
  link "プロフィール", users_identification_path
  parent :users
end

crumb :users_confirm_sign_out do
  link "ログアウト", confirm_sign_out_users_path
  parent :users
end

crumb :users_sell_items_list do
  link "出品した商品-出品中", sell_items_list_users_path
  parent :users
end

crumb :user_credit_cards do
  link "支払い方法", user_credit_cards_path(user_id: current_user.id)
  parent :users
end

crumb :add_user_credit_cards do
  link "クレジットカード情報入力", add_user_credit_cards_path(user_id: current_user.id)
  parent :user_credit_cards
end

crumb :large_categories do
  link "カテゴリー一覧", large_categories_path
  parent :root
end

crumb :large_category do |large_category|
  link large_category.name, large_category_path(large_category.id)
  parent :large_categories
end

crumb :middle_category do |middle_category|
  link middle_category.name, middle_category_path(middle_category.id)
  parent :large_category, middle_category.large_category
end

crumb :small_category do |small_category|
  link small_category.name, small_category_path(small_category.id)
  parent :middle_category, small_category.middle_category
end

crumb :brand_upper_category do |brand_upper_category|
  link "ブランド一覧", brand_upper_category_path(brand_upper_category.id)
  parent :root
end

crumb :brand do |brand|
  link brand.name, brand_path(brand.id)
  parent :brand_upper_category, BrandUpperCategory.find(1)
end