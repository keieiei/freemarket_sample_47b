class ItemsController < ApplicationController
  before_action :set_large_categories, only: [:index, :show, :search]
  before_action :set_brands, only: [:index, :show, :search]
  before_action :set_pickup_categories, only: [:index]
  before_action :set_pickup_brands, only: [:index]
  before_action :authenticate_user!, only: [:new,:buy_confirm,:buy_complete]
  before_action :set_item,only:[:buy_confirm,:show,:buy]

  def index
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

  def buy_confirm
      return render :show if @item.seller_id == current_user.id  
  end

  def show
    @item_prev = set_prev_item(@item)
    @item_next = set_next_item(@item)
    @items_same_seller =  @item.seller.seller_items
    @items_same_type =  set_items_same_type(@item)
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

  def search
    @items = Item.where('name LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page]).per(5)
    @search_params = search_params
    @size_types = SizeType.all
    @item_conditions = ItemCondition.all
    @delivery_charges = DeliveryCharge.all
    set_select_objects(@search_params)
  end

  def get_middle_categories
    id = get_middle_categories_params[:large_category_id].to_i
    if id == 0
      @middle_categories = nil
    else
      @middle_categories = LargeCategory.find(id).middle_categories
    end
  end

  def get_small_categories
    id = get_small_categories_params[:middle_category_id].to_i
    if id == 0
      @small_categories = nil
    else
      @small_categories = MiddleCategory.find(id).small_categories
    end
  end

  def get_item_sizes
    id = get_item_sizes_params[:size_type_id].to_i
    if id == 0
      @item_sizes = nil
    else
      @item_sizes = SizeType.find(id).item_sizes
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :detail,:state,:delivery_charge,:delivery_prefecture,:delivery_time,:delivery_way,:price,:size,:large_category,:middle_category,:small_category, :brand, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def show_params
    params.permit(:id)
  end

  def search_params
    params_keyword = set_empty_search_params(params.permit(:keyword), "keyword", "")
    params_search_sort = set_empty_search_params(params.permit(:search_sort), "search_sort", 0)
    params_large_category_id = set_empty_search_params(params.permit(:large_category_id), "large_category_id", 0)
    params_middle_category_id = set_empty_search_params(params.permit(:middle_category_id), "middle_category_id", 0)
    params_brand_name = set_empty_search_params(params.permit(:brand_name), "brand_name", "")
    params_size_type_id = set_empty_search_params(params.permit(:size_type_id), "size_type_id", 0)
    params_price_select = set_empty_search_params(params.permit(:price_select), "price_select", 0)
    params_price_min = set_empty_search_params(params.permit(:price_min), "price_min", "")
    params_price_max = set_empty_search_params(params.permit(:price_max), "price_max", "")
    params_small_category_ids = set_empty_array_search_params(params.permit(small_category_id: {}), "small_category_id", {})
    params_item_size_ids = set_empty_array_search_params(params.permit(item_size_id: {}), "item_size_id", {})
    params_item_condition_ids = set_empty_array_search_params(params.permit(item_condition_id: {}), "item_condition_id", {})
    params_delivery_charge_ids = set_empty_array_search_params(params.permit(delivery_charge_id: {}), "delivery_charge_id", {})
    params_status_on_sale_ids = set_empty_array_search_params(params.permit(status_on_sale_id: {}), "status_on_sale_id", {})
    return search_params = params_keyword.merge(params_search_sort).merge(params_large_category_id).merge(params_middle_category_id).merge(params_brand_name).merge(params_size_type_id).merge(params_price_select).merge(params_price_min).merge(params_price_max).merge(params_small_category_ids).merge(params_item_size_ids).merge(params_item_condition_ids).merge(params_delivery_charge_ids).merge(params_status_on_sale_ids)
  end

  def get_middle_categories_params
    params.permit(:large_category_id)
  end

  def get_small_categories_params
    params.permit(:middle_category_id)
  end

  def get_item_sizes_params
    params.permit(:size_type_id)
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

  def set_empty_search_params(params_hash, key_name, empty_value)
    return { key_name => empty_value } if params_hash.empty?
    return params_hash
  end

  def set_empty_array_search_params(params_hash, key_name, empty_value)
    return { key_name => empty_value } if params_hash.empty?
    return { key_name => params_hash.values[0].keys.map(&:to_i) }
  end

  def set_select_objects(search_params)
    if search_params[:large_category_id].to_i > 0
      @large_category = LargeCategory.find(search_params[:large_category_id].to_i)
    else
      @large_category = nil
    end
    if search_params[:middle_category_id].to_i > 0
      @middle_category = MiddleCategory.find(search_params[:middle_category_id].to_i)
    else
      @middle_category = nil
    end
    if search_params[:size_type_id].to_i > 0
      @size_type = SizeType.find(search_params[:size_type_id].to_i)
    else
      @size_type = nil
    end
  end

  def set_items_same_type(item)
    items = {}
    if item.brand.nil?
      if item.small_category.nil?
        items[:types_name] = [item.middle_category.name, item.large_category.name]
        items[:items] = Item.where(middle_category_id: item.middle_category.id).where(large_category_id: item.large_category.id)
      else
        items[:types_name] = [item.small_category.name, item.middle_category.name]
        items[:items] = Item.where(small_category_id: item.small_category.id).where(middle_category_id: item.middle_category.id)
      end
    else
      if item.small_category.nil?
        items[:types_name] = [item.brand.name, item.middle_category.name]
        items[:items] = Item.where(brand_id: item.brand.id).where(middle_category_id: item.middle_category.id)
      else
        items[:types_name] = [item.brand.name, item.small_category.name]
        items[:items] = Item.where(brand_id: item.brand.id).where(small_category_id: item.small_category.id)
      end
    end
    return items
  end

  def set_prev_item(item)
    low_max_id = Item.where("id < #{item.id}").maximum(:id)
    return Item.find(low_max_id) unless low_max_id.nil?
    up_max_id = Item.where("id > #{item.id}").maximum(:id)
    return Item.find(up_max_id)
  end
  
  def set_next_item(item)
    up_min_id = Item.where("id > #{item.id}").minimum(:id)
    return Item.find(up_min_id) unless up_min_id.nil?
    low_min_id = Item.where("id < #{item.id}").minimum(:id)
    return Item.find(low_min_id)
  end
end
