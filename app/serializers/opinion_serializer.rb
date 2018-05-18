# == Schema Information
#
# Table name: opinions
#
#  id             :integer          not null, primary key
#  content        :string
#  date           :date
#  like           :integer
#  pro            :boolean
#  law_project_id :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :like, :pro
  
  belongs_to :user, serializer: OpinionAuthorSerializer
end
