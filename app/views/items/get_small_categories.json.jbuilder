unless @small_categories.nil?
  json.small_categories do
    json.array! @small_categories, :id, :name
  end
else
  json.small_categories 0
end
unless @item_sizes.nil?
  json.item_sizes do
    json.array! @item_sizes, :id, :size
  end
else
  json.item_sizes 0
end
json.brand_allow @brand_allow