if @middle_categories.present?
  json.array! @middle_categories, :id, :name
end