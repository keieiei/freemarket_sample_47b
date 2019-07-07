# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :confirm_signed_in, except: [:new, :create, :confirm]

  # GET /resource/sign_up
  def new
    @user = User.new
    @page_number = 1
  end

  def confirm
    @user = User.new(configure_sign_up_params)
    @page_number = 1
    return render :new unless @user.valid?(:admin)
    @page_number = 2
    session[:user_1st_params] = configure_sign_up_params
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @page_number = 2
    return render :confirm unless @user.valid?
    @user.save
    sign_in @user
    session[:user_1st_params] = nil
    redirect_to new_user_receiver_information_path(current_user.id)
  end

  def complete
    @page_number = 5
  end

  def edit_profile
  end

  def update_profile
    @valid_user = User.new(update_profile_params)
    if validate_update_profile(@valid_user)
      current_user.update_columns(update_profile_params.to_hash)
      redirect_to users_path
    else
      render :edit_profile
    end 
  end

  def identification
  end

  def update_identification
    @valid_user = User.new(update_identification_params)
    if validate_update_identification(@valid_user)
      current_user.update_columns(update_identification_params.to_hash)
      redirect_to users_path
    else
      render :identification
    end 
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day)
  end

  def phone_number_params
    params.require(:user).permit(:phone_number)
  end

  def user_params
    session[:user_1st_params].merge(phone_number_params)
  end

  def update_profile_params
    params.require(:user).permit(:nickname, :profile)
  end

  def update_identification_params
    params.require(:user).permit(:postal_code, :prefecture, :city, :street, :building)
  end

  def confirm_signed_in
    return redirect_to new_user_session_path unless user_signed_in?
  end

  def validate_update_profile(user)
    return user.valid_nickname?
  end

  def validate_update_identification(user)
    return user.valid_postal_code?
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
