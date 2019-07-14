class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    10.times{@item.images.build}
  end
  
  def create
    @item = Item.new(items_params)
    if @item.save
      render :index
    else
      render :new
    end
  end

  def show
    @item = Item.find(show_params[:id])
    @item_prev = Item.find(1)
    @item_next = Item.find(1)
    @other_items_same_seller =  Item.where(id: 1)
    @other_items_same_category_brand =  Item.where(id: 1)
  end

  private
  def items_params
    params.require(:item).permit(:name, :detail,:state,:delivery_charge,:delivery_prefecture,:delivery_time,:delivery_way,:price,:size,:large_category,:middle_category,:small_category, :brand, images_attributes: [:image])
  end

  def show_params
    params.permit(:id)
  end

end
