class MiddleCategoryValidator < ActiveModel::Validator
  def validate(record)
    large_category_id = record.send(options[:large_category_id])
    middle_category_id = record.send(options[:middle_category_id])
    middle_category_ids = MiddleCategory.where(large_category_id: large_category_id).ids

    unless middle_category_ids.empty? && middle_category_id.nil? && middle_category_ids.include?(middle_category_id)
      record.errors.add(:base, 'DBに登録されているidを入力してください')
    end
  end
end