# == Schema Information
#
# Table name: law_projects
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :string
#  publication_date :date
#  yes_votes        :integer
#  not_votes        :integer
#  image            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LawProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :publication_date, :yes_votes, :not_votes, :image, :state, :speaker, :ready
  has_many :opinions, serializer: OpinionSerializer
  has_many :tags, serializer: TagSerializer
end
