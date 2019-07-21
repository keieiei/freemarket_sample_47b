class SmallCategoriesController < ApplicationController
  before_action :set_large_categories, only: [:show]
  before_action :set_brands, only: [:show]

  def show
    @small_category = SmallCategory.find(show_params[:id])
    @items = @small_category.items.order("created_at DESC").page(params[:page]).per(5)
    @nav_lists = middle_nav_lists(@small_category.middle_category)
  end

  private
  def show_params
    params.permit(:id)
  end

  def set_large_categories
    @large_categories = LargeCategory.all
  end

  def set_brands
    @brands = Brand.all
  end
end
