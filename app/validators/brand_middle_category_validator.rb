class BrandMiddleCategoryValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    middle_category_id = record.send(options[:middle_category_id])
    unless middle_category_id.nil?
      brand = Brand.find(brand_id)
      middle_category = MiddleCategory.find(middle_category_id)
      unless BrandMiddleCategory.where(brand_id: brand_id).where(middle_category_id: middle_category_id).empty?
        return record.errors.add(:base, '既にその組み合わせは登録済')
      end
      unless brand.brand_brand_upper_category.pluck(:brand_upper_category_id).include?(middle_category.brand_upper_category.id)
        record.errors.add(:base, 'brand_upper_categoryが異なるため登録不可')
      end
    end
  end
end