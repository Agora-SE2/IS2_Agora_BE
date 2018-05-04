class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end
end
