class ReceiverInformationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @receiver_information = ReceiverInformation.new
    @page_number = 3
  end

  def create
    @receiver_information = ReceiverInformation.new(receiver_information_params)
    @page_number = 3
    return render :new unless @receiver_information.valid?
    @receiver_information.save
    redirect_to new_user_credit_card_path(current_user.id)
  end

  private

  def receiver_information_params
    params.require(:receiver_information).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :street, :building, :phone_number).merge(user_id: current_user.id)
  end
end
