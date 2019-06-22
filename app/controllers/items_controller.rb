class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new

  end
  
  def create
    @item = Item.new(items_params)
    if @item.save
      puts"ほぞんできてる"
      render ("items/index")
    else
      puts"ほぞんできていない"
      render ("items/new")
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :detail,:state,:delivery_charge,:delivery_prefecture,:delivery_time,:delivery_way,:price,:size,:large_category,:middle_category,:small_category, :brand, images_attributes: [:image])
  end

end
