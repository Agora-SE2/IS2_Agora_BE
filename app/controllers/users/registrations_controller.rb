# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  def create

    user = User.create(:email=>params[:email],
    :password=>params[:password], 
    :password_confirmation=>params[:password_confirmation],
    :user_name=>params[:userName],
    :birth_name=>params[:birthName],
    :description=>params[:description],
    :sign_in_count=> 0,
    :is_admin=> params[:isAdmin])
    if user.save
      render :json=> {:auth_token=>user.authentication_token, :email=>user.email, :id=>user.id, :isAdmin=>user.is_admin, :birthName=>user.birth_name, :userName=>user.user_name}, :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
end
