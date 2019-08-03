if @item_sizes.present?
  json.array! @item_sizes, :id, :size
end