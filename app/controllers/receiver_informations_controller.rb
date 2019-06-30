class ReceiverInformationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @receiver_information = ReceiverInformation.new
  end
end
