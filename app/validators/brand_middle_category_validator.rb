class BrandMiddleCategoryValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    middle_category_id = record.send(options[:middle_category_id])
    unless middle_category_id.nil? && BrandMiddleCategory.where(brand_id: brand_id).where(middle_category_id: middle_category_id).empty?
      record.errors.add(:base, 'DBに登録済の組み合わせ')
    end
  end
end