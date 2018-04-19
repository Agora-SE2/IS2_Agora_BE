
json.extract! @user, :email, :is_admin, :birth_name, :user_name, :description, :id
json.url opinion_url(@user, format: :json)