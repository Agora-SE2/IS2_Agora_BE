# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  prepend_before_filter :require_no_authentication, :only => [:create ]
  
  before_filter :ensure_params_exist

  respond_to :json
  
  # before_action :configure_sign_in_params, only: [:create]
def create
    #build_resource
    resource = User.find_for_database_authentication(:email=>params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      sign_in("user", resource)
      render :json=> {:id=>resource.id, :success=>true, :auth_token=>resource.authentication_token,  :email=>resource.email, :isAdmin=>resource.is_admin, :birthName=>resource.birth_name, :userName=>resource.user_name}
      return
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
  
  def destroy
    set_flash_message :notice, :signed_out if signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
  end
   protected

  def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    render :json=> {:success=>false, :message=>"wrong email or pass"}
  end

  def ensure_params_exist
      return unless params[:email].blank? or params[:password].blank?
    render :json=>{:success=>false, :message=>"missing  parameter"}, :status=>422
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
