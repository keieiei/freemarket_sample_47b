module Common
  extend ActiveSupport::Concern

  def nav_lists(target, type)
    lists = []
    case type
    when "small", "middle"
      target.small_categories.each do |small_category|
        lists << {name: small_category.name, link: small_category_path(small_category.id)}
      end
      return lists
    when "large"
      target.middle_categories.each do |middle_category|
        lists << {name: middle_category.name, link: middle_category_path(middle_category.id)}
      end
      return lists
    when "brand"
      unless target.brand_small_categories.empty?
        target.brand_small_categories.each do |brand_small_category|
          lists << {name: brand_small_category.small_category.name, link: small_category_path(brand_small_category.small_category.id)}
        end
        return lists
        unless target.brand.middle_categories.empty?
          target.brand_middle_categories.each do |brand_middle_category|
            lists << {name: brand_middle_category.middle_category.name, link: middle_category_path(brand_middle_category.middle_category.id)}
          end
          return lists
          unless target.brand_large_categories.empty?
            target.brand_large_categories.each do |brand_large_category|
              lists << {name: brand_large_category.large_category.name, link: large_category_path(brand_large_category.large_category.id)}
            end
            return lists
          end
        end
      end
    end
  end
end