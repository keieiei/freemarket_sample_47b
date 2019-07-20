class BrandLargeCategoryValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    large_category_id = record.send(options[:large_category_id])
    unless large_category_id.nil? && BrandLargeCategory.where(brand_id: brand_id).where(large_category_id: large_category_id).empty?
      record.errors.add(:base, 'DBに登録済の組み合わせ')
    end
  end
end