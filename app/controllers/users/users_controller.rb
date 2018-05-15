
class Users::UsersController < Devise::UsersController

  def show
    #@user = User.find(params[:id])
    render json: @user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end