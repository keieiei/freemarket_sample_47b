if @small_categories.present?
  json.small_categories do
    json.array! @small_categories, :id, :name
  end
else
  json.small_categories 0
end
if @item_sizes.present?
  json.item_sizes do
    json.array! @item_sizes, :id, :size
  end
else
  json.item_sizes 0
end
json.brand_allow @brand_allow