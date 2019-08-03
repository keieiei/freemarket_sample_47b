if @item_sizes.present?
  json.item_sizes do
    json.array! @item_sizes, :id, :size
  end
else
  json.item_sizes 0
end
json.brand_allow @brand_allow