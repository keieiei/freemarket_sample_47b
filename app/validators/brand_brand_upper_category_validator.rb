class BrandBrandUpperCategoryValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    brand_upper_category_id = record.send(options[:brand_upper_category_id])
    unless brand_upper_category_id.nil?
      brand = Brand.find(brand_id)
      brand_upper_category = BrandUpperCategory.find(brand_upper_category_id)
      unless BrandBrandUpperCategory.where(brand_id: brand_id).where(brand_upper_category_id: brand_upper_category_id).empty?
        return record.errors.add(:base, '既にその組み合わせは登録済')
      end
    end
  end
end