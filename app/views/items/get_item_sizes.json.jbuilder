unless @item_sizes.nil?
  json.array! @item_sizes, :id, :size
else
  json.child! do
    json.id 0
    json.size "なし"
  end
end