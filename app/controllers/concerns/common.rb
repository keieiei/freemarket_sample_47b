module Common
  extend ActiveSupport::Concern

  def nav_lists(target, type)
    case type 
    when "small", "middle"
      return lists = target.small_categories
    when "large"
      return lists = target.middle_categories
    when "brand"
      return lists = target.small_categories unless target.small_categories.empty?
      return lists = target.middle_categories unless target.middle_categories.empty?
      return lists = target.large_categories unless target.large_categories.empty?
    end
  end

end