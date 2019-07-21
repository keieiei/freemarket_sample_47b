class CreditCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_large_categories, only: [:index, :add]
  before_action :set_brands, only: [:index, :add]

  def index
  end

  def new
    @credit_card = CreditCard.new
    @page_number = 4
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @page_number = 4
    return render :new unless @credit_card.valid?
    @credit_card.save
    redirect_to users_sign_up_complete_path
  end

  def destroy
    if current_user.credit_card.destroy
      redirect_to user_credit_cards_path(current_user.id)
    else
      render :index
    end
  end

  def add
    @credit_card = CreditCard.new(user_id: current_user.id)
  end

  def add_create
    @credit_card = CreditCard.new(credit_card_params)
    if @credit_card.save
      redirect_to user_credit_cards_path(current_user.id)
    else
      render :add
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(:card_number, :valid_month, :valid_year, :security_code).merge(user_id: current_user.id)
  end

  def set_large_categories
    @large_categories = LargeCategory.all
  end

  def set_brands
    @brands = Brand.all
  end
end
