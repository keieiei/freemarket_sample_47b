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
      unless target.small_categories.empty?
        target.small_categories.each do |small_category|
          lists << {name: small_category.name, link: small_category_path(small_category.id)}
        end
        return lists
        unless target.middle_categories.empty?
          target.middle_categories.each do |middle_category|
            lists << {name: middle_category.name, link: middle_category_path(middle_category.id)}
          end
          return lists
          unless target.large_categories.empty?
            target.large_categories.each do |large_category|
              lists << {name: large_category.name, link: large_category_path(middle_category.id)}
            end
            return lists
          end
        end
      end
    end
  end

end