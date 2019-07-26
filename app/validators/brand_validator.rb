class BrandValidator < ActiveModel::Validator
  def validate(record)
    brand_id = record.send(options[:brand_id])
    middle_category_id = record.send(options[:middle_category_id])
    small_category_id = record.send(options[:small_category_id])

    unless middle_category_id.nil?
      brand_upper_category_m = MiddleCategory.find(middle_category_id).brand_upper_category
      unless brand_upper_category_m.nil?
        unless brand_id.nil?
          brand_upper_category_b = Brand.find(brand_id).brand_upper_category
          return record.errors.add(:base, 'ブランド種類が異なる(m)') unless brand_upper_category_b == brand_upper_category_m
        end
      end
      unless small_category_id.nil?
        brand_upper_category_s = SmallCategory.find(small_category_id).brand_upper_category
        if brand_upper_category_s.nil?
          return record.errors.add(:base, 'ブランド登録未許可') unless brand_id.nil?
        else
          unless brand_id.nil?
            brand_upper_category_b = Brand.find(brand_id).brand_upper_category
            return record.errors.add(:base, 'ブランド種類が異なる(s)') unless brand_upper_category_b == brand_upper_category_s
          end
        end
      end
    end
  end
end