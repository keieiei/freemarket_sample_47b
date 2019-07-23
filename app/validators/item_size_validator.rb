class ItemSizeValidator < ActiveModel::Validator
  def validate(record)
    item_size_id = record.send(options[:item_size_id])
    middle_category_id = record.send(options[:middle_category_id])
    small_category_id = record.send(options[:small_category_id])

    if !middle_category_id.nil?
      size_type_m = MiddleCategory.find(middle_category_id).size_type
      if !size_type_m.nil?
        return record.errors.add(:base, 'サイズ未登録') if item_size_id.nil?
        size_type_i = ItemSize.find(item_size_id).size_type
        return record.errors.add(:base, 'サイズ種類が異なる') if size_type_i != size_type_m
      end
      if !small_category_id.nil?
        size_type_s = SmallCategory.find(small_category_id).size_type
        if size_type_s.nil?
          return record.errors.add(:base, 'サイズ登録未許可') if !item_size_id.nil?
        else
          return record.errors.add(:base, 'サイズ未登録') if item_size_id.nil?
          size_type_i = ItemSize.find(item_size_id).size_type
          return record.errors.add(:base, 'サイズ種類が異なる') if size_type_i != size_type_s
        end
      end
    end
  end
end
