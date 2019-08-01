class ItemsController < ApplicationController
  before_action :set_large_categories, only: [:index, :show]
  before_action :set_brands, only: [:index, :show]
  before_action :set_pickup_categories, only: [:index]
  before_action :set_pickup_brands, only: [:index]
  before_action :authenticate_user!, only: [:new,:buy_confirm,:buy_complete]
  before_action :set_item,only:[:buy_confirm,:show,:buy]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end
  
  def create
    @item = Item.new(items_params)
    @item.update_attribute(:item_state_id , current_user.id)
    if  @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def buy_confirm
      return render :show if @item.seller_id == current_user.id  
  end

  def show
    @item_prev = Item.find(show_params[:id])
    @item_next = Item.find(show_params[:id])
    @other_items_same_seller =  Item.where(show_params[:id])
    @other_items_same_category_brand =  Item.where(show_params[:id])
  end

  def buy
    if @item.update_attribute(:buyer_id , current_user.id)
      render :buy_complete
    else
      render :index
    end
  end

  def buy_complete
  end

  private
  def items_params
    params.require(:item).permit(:name, :detail,:item_condition_id,:delivery_charge_id,:prefecture_id,:delivery_time_id,:delivery_way_id,:price,:item_size_id,:large_category_id,:middle_category_id,:small_category_id, :brand_id, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def show_params
    params.permit(:id)
  end

  def set_large_categories
    @large_categories = LargeCategory.all
  end

  def set_brands
    @brands = Brand.all
  end

  def set_pickup_categories
    pickup_ids = [1, 2, 3, 4]
    @pickup_categories = []
    pickup_ids.each do |id|
      @pickup_categories << { link: large_category_path(id) , pickup: LargeCategory.find(id), items: Item.where(large_category_id: id).limit(4) }
    end
    return @pickup_categories
  end

  def set_pickup_brands
    pickup_ids = [1, 2, 3, 4]
    @pickup_brands = []
    pickup_ids.each do |id|
      @pickup_brands << { link: brand_path(id), pickup: Brand.find(id), items: Item.where(brand_id: id).limit(4) }
    end
    return @pickup_brands
  end

  def set_item
    @item = Item.find(show_params[:id])
  end
end
