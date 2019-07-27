class BrandsController < ApplicationController
  before_action :set_large_categories, only: [:show]
  before_action :set_brands, only: [:show]

  def show
    @brand = Brand.find(show_params[:id])
    @items = @brand.items.order("created_at DESC").page(params[:page]).per(5)
    @nav_lists = brand_nav_lists(@brand)
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
