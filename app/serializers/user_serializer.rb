class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :is_admin, :user_name, :birth_name, :description
  has_many :opinions
  
  def opinions
    object.opinions.order("like": :desc).paginate(:page => 1, :per_page => 1)
  end
end
