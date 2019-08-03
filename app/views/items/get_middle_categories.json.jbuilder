unless @middle_categories.nil?
  json.array! @middle_categories, :id, :name
end