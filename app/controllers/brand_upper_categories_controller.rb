class BrandUpperCategoriesController < ApplicationController
  before_action :set_large_categories, only: [:show]
  before_action :set_brands, only: [:show]
  before_action :set_brand_upper_categories, only: [:show]

  def show
    @brand_upper_category = BrandUpperCategory.find(show_params[:id])
  end

  private
  def show_params
    params.permit(:id)
  end

  def set_large_categories
    @large_categories = LargeCategory.all
  end

  def set_brands
    @brands = Brand.all.limit(5)
  end

  def set_brand_upper_categories
    @brand_upper_categories = BrandUpperCategory.all
  end
end
