module Common
  extend ActiveSupport::Concern

  def large_nav_lists(target)
    lists = []
    target.middle_categories.each do |middle_category|
      lists << {name: middle_category.name, link: middle_category_path(middle_category.id)}
    end
    return lists
  end

  def middle_nav_lists(target)
    lists = []
    target.small_categories.each do |small_category|
      lists << {name: small_category.name, link: small_category_path(small_category.id)}
    end
    return lists
  end

  def brand_nav_lists(target)
    lists = []
    if !target.brand_small_categories.empty?
      target.brand_small_categories.each do |brand_small_category|
        lists << {name: brand_small_category.small_category.name, link: small_category_path(brand_small_category.small_category.id)}
      end
      return lists
      if !target.brand.middle_categories.empty?
        target.brand_middle_categories.each do |brand_middle_category|
          lists << {name: brand_middle_category.middle_category.name, link: middle_category_path(brand_middle_category.middle_category.id)}
        end
        return lists
        if !target.brand_large_categories.empty?
          target.brand_large_categories.each do |brand_large_category|
            lists << {name: brand_large_category.large_category.name, link: large_category_path(brand_large_category.large_category.id)}
          end
          return lists
        end
      end
    end
  end

end