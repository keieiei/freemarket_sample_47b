class ItemsController < ApplicationController
  before_action :set_large_categories, only: [:index, :show, :search, :detail_search]
  before_action :set_brands, only: [:index, :show, :search, :detail_search]
  before_action :set_pickup_categories, only: [:index]
  before_action :set_pickup_brands, only: [:index]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :buy_confirm, :buy_complete, :destroy]
  before_action :set_item,only:[:buy_confirm,:show,:buy, :destroy,:edit,:update]

  def index
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end
  
  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.brand_id = set_brand_id(@item, brand_params) if brand_params.present?
      @item.save
      return redirect_to root_path
    else
      render :nw
    end
  end

  def destroy
    session[:tmp_from_item_destroy] = true
    if @item.seller == current_user
      if @item.destroy
        return redirect_to sell_items_list_users_path
      end
    end
    redirect_to item_path(@item.id)
  end

  def edit
    @brand = @item.brand if @item.brand_id.present?
    @images = @item.images
  end

  def update
    if @item.update!(items_params.merge(brand_id: nil))
      @brand_id = set_brand_id(Item.new(items_params), brand_params)
      if  @item.update!(items_params.merge(brand_id: @brand_id))
        redirect_to root_path
      else
        render :edit
      end
    end
  end

  def buy_confirm
      return render :show if @item.seller_id == current_user.id || @item.item_state_id == 4
  end

  def show
    @item_prev = set_prev_item(@item)
    @item_next = set_next_item(@item)
    @items_same_seller =  @item.seller.seller_items
    @items_same_type =  set_items_same_type(@item)
    if session[:tmp_from_item_destroy] == true
      @from_item_destory = true
      session[:tmp_from_item_destroy] = nil
    else
      @from_item_destory = false
    end
  end

  def buy
    if @item.update_attributes(buyer_id: current_user.id, item_state_id: 4)
      render :buy_complete
    else
      render :index
    end
  end

  def buy_complete
  end

  def search
    @keyword = search_params[:keyword]
    @items = Item.where('name LIKE(?)', "%#{@keyword}%").page(params[:page]).per(5)
    @size_types = SizeType.all
    @item_conditions = ItemCondition.all
    @delivery_charges = DeliveryCharge.all
    @item_states = ItemState.all
    @sort_options = SortOption.all
    @large_category = nil
    @middle_category = nil
    @size_type = nil
    @selected_sort = "id desc"
    @q = Item.ransack(params[:q])
  end

  def detail_search
    @q = Item.ransack(detail_search_params)
    @items = @q.result(distinct: true).page(params[:page]).per(5)
    @keyword = detail_search_params[:name_or_detail_cont]
    @size_types = SizeType.all
    @item_conditions = ItemCondition.all
    @delivery_charges = DeliveryCharge.all
    @item_states = ItemState.all
    @sort_options = SortOption.all
    @large_category = nil
    @large_category = LargeCategory.find(detail_search_params[:large_category_id_eq]) unless detail_search_params[:large_category_id_eq].blank?
    @middle_category = nil
    @middle_category = MiddleCategory.find(detail_search_params[:middle_category_id_eq]) unless detail_search_params[:middle_category_id_eq].blank?
    @size_type = nil
    @size_type = SizeType.find(detail_search_params[:item_size_size_type_id_eq]) unless detail_search_params[:item_size_size_type_id_eq].blank?
    @selected_sort = detail_search_params[:sorts]
    render :search
  end

  def get_middle_categories
    id = get_middle_categories_params[:large_category_id]
    if id.blank?
      @middle_categories = nil
    else
      @middle_categories = LargeCategory.find(id).middle_categories
    end
  end

  def get_small_categories
    id = get_small_categories_params[:middle_category_id]
    @small_categories = nil
    @item_sizes = nil
    @brand_allow = false
    if id.present?
      @middle_category = MiddleCategory.find(id)
      @small_categories = @middle_category.small_categories
      @item_sizes = @middle_category.size_type.item_sizes if @middle_category.size_type_id.present?
      @brand_allow = true if @middle_category.brand_upper_category_id.present?
    end
  end

  def get_item_sizes
    id = get_item_sizes_params[:size_type_id]
    if id.blank?
      @item_sizes = nil
    else
      @item_sizes = SizeType.find(id).item_sizes
    end
  end

  def get_sizes_brand_allow
    id = get_sizes_brand_allow_params[:small_category_id]
    @item_sizes = nil
    @brand_allow = false
    if id.present?
      @small_category = SmallCategory.find(id)
      @item_sizes = @small_category.size_type.item_sizes if @small_category.size_type_id.present?
      @brand_allow = true if @small_category.brand_upper_category_id.present?
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :detail,:item_condition_id,:delivery_charge_id,:prefecture_id,:delivery_time_id,:delivery_way_id,:price,:item_size_id,:large_category_id,:middle_category_id,:small_category_id, images_attributes: [:id,:image]).merge(seller_id: current_user.id, item_state_id: 1)
  end

  def brand_params
    return params.require(:brand).permit(:name) if params[:brand].present?
    return { name: nil }
  end

  def show_params
    params.permit(:id)
  end

  def search_params
    params.permit(:keyword)
  end

  def detail_search_params
    params.require(:q).permit(:sorts, :name_or_detail_cont, :large_category_id_eq, :middle_category_id_eq, { small_category_id_eq_any: [] }, :brand_name_cont, :item_size_size_type_id_eq, { item_size_id_eq_any: [] }, :price_gteq, :price_lteq, { item_condition_id_eq_any: [] }, { delivery_charge_id_eq_any: [] }, { item_state_id_eq_any: [] })
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

  def get_sizes_brand_allow_params
    params.permit(:small_category_id)
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

  def set_brand_id(item, brand_params)
    if brand_params[:name].present?
      if item.small_category.present?
        brand_upper_category = SmallCategory.find(item.small_category.id).brand_upper_category
      else
        brand_upper_category = MiddleCategory.find(item.middle_category.id).brand_upper_category
      end
      brand = brand_upper_category.brands.find_by(brand_params)
      if brand.nil?
        brand = Brand.create(brand_params)
        BrandBrandUpperCategory.create(brand_id: brand.id, brand_upper_category: brand_upper_category)
        if item.small_category.present?
          BrandSmallCategory.create(brand_id: brand.id, small_category_id: item.small_category.id)
        else
          BrandMiddleCategory.create(brand_id: brand.id, middle_category_id: item.middle_category.id)
        end
      end
      return brand.id
    else
      return nil
    end
  end

end
