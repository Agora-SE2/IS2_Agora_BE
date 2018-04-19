
class Users::UsersController < Devise::UsersController

def show
  @user = User.find(params[:id])
end

end