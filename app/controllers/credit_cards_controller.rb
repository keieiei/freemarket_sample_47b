class CreditCardsController < ApplicationController
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

  private

  def credit_card_params
    params.require(:credit_card).permit(:card_number, :valid_month, :valid_year, :security_code).merge(user_id: current_user.id)
  end
end
