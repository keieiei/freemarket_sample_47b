module Common
  extend ActiveSupport::Concern

  def large_nav_lists(large_category)
    lists = []
    large_category.middle_categories.each do |middle_category|
      lists << {name: middle_category.name, link: middle_category_path(middle_category.id)}
    end
    return lists
  end

  def middle_nav_lists(middle_category)
    lists = []
    middle_category.small_categories.each do |small_category|
      lists << {name: small_category.name, link: small_category_path(small_category.id)}
    end
    return lists
  end

  def brand_nav_lists(brand)
    lists = []
    unless brand.brand_small_categories.empty?
      brand.brand_small_categories.each do |brand_small_category|
        lists << {name: brand_small_category.small_category.name, link: small_category_path(brand_small_category.small_category.id)}
      end
      return lists
      unless brand.brand_middle_categories.empty?
        brand.brand_middle_categories.each do |brand_middle_category|
          lists << {name: brand_middle_category.middle_category.name, link: middle_category_path(brand_middle_category.middle_category.id)}
        end
        return lists
      end
    end
  end

end