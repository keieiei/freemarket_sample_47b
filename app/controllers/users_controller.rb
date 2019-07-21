class UsersController < ApplicationController
  before_action :set_large_categories, only: [:index, :confirm_sign_out]
  before_action :set_brands, only: [:index, :confirm_sign_out]

  def index
  end
  def confirm_sign_out
  end

  private

  def set_large_categories
    @large_categories = LargeCategory.all
  end

  def set_brands
    @brands = Brand.all
  end
end
