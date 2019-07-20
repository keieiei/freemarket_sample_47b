class BrandSmallCategoryValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    small_category_id = record.send(options[:small_category_id])
    unless small_category_id.nil? && BrandSmallCategory.where(brand_id: brand_id).where(small_category_id: small_category_id).empty?
      record.errors.add(:base, 'DBに登録済の組み合わせ')
    end
  end
end