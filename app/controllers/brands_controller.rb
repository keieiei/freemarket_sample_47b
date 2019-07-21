class BrandsController < ApplicationController
  before_action :set_large_categories, only: [:index, :show]
  before_action :set_brands, only: [:index, :show]

  def index
  end
  def show
    @brand = Brand.find(show_params[:id])
    @items = @brand.items.order("created_at DESC").page(params[:page]).per(5)
    @nav_lists = nav_lists(@brand, "brand")
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
