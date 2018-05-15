class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end
  
  def update
    @user = User.find_by_id(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def user_params
      params.require(:user).permit(:email, :birth_name, :user_name, :description, :is_admin)
  end
  
end
