json.child! do
  json.id 0
  json.name "すべて"
end

unless @middle_categories.nil?
  json.array! @middle_categories, :id, :name
end