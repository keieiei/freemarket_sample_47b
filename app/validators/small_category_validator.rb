class SmallCategoryValidator < ActiveModel::Validator
  def validate(record)
    middle_category_id = record.send(options[:middle_category_id])
    small_category_id = record.send(options[:small_category_id])
    small_category_ids = SmallCategory.where(middle_category_id: middle_category_id).ids

    unless small_category_ids.empty? && small_category_id.nil?
      unless small_category_ids.include?(small_category_id)
        record.errors.add(:base, 'DBに登録されているidを入力してください')
      end
    end
  end
end