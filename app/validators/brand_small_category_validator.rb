class BrandSmallCategoryValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    small_category_id = record.send(options[:small_category_id])
    unless small_category_id.nil?
      brand = Brand.find(brand_id)
      small_category = SmallCategory.find(small_category_id)
      unless BrandSmallCategory.where(brand_id: brand_id).where(small_category_id: small_category_id).empty?
        return record.errors.add(:base, '既にその組み合わせは登録済')
      end
      unless brand.brand_brand_upper_categories.pluck(:brand_upper_category_id).include?(small_category.brand_upper_category.id)
        record.errors.add(:base, 'brand_upper_categoryが異なるため登録不可')
      end
    end
  end
end