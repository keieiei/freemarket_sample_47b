class UsersController < ApplicationController
  before_action :set_large_categories, only: [:index, :confirm_sign_out, :sell_items_list]
  before_action :set_brands, only: [:index, :confirm_sign_out, :sell_items_list]

  def index
  end
  def confirm_sign_out
  end
  def sell_items_list
    @sell_items = Item.where(seller_id: current_user.id).where(item_state_id:1).page(params[:page]).per(3)
    if session[:tmp_from_item_destroy] == true
      @from_item_destory = true
      session[:tmp_from_item_destroy] = nil
    else
      @from_item_destory = false
    end
  end

  private

  def set_large_categories
    @large_categories = LargeCategory.all
  end

  def set_brands
    @brands = Brand.all
  end
end
