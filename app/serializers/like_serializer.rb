# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  opinion_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LikeSerializer < ActiveModel::Serializer
  attributes :id, :opinion_id, :user_id
end
