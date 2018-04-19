# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
def create
  resource = User.find_for_database_authentication(email: params[:email])
  return invalid_login_attempt unless resource

  if resource.valid_password?(params[:user][:password])
    sign_in :user, resource
    return render nothing: true
  end

  invalid_login_attempt
 end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    render json: flash[:alert], status: 401
  end

  # protected

def invalid_login_attempt
  set_flash_message(:alert, :invalid)
  render json: flash[:alert], status: 401
end

  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
