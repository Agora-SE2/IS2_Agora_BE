# frozen_string_literal: true

class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if request.env["omniauth.auth"].info.email.blank?
      redirect_to "/user/auth/facebook?auth_type=rerequest&scope=email"
    else
      @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      end
    end
  end

  def facebook_access_token
  end

  def failure
    redirect_to root_path
  end
  
end