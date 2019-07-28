unless @small_categories.nil?
  json.array! @small_categories, :id, :name
else
  json.child! do
    json.id 0
    json.name "なし"
  end
end