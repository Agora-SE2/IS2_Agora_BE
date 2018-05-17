class LawProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :publication_date, :yes_votes, :not_votes, :image, :state, :speaker
  has_many :opinions, serializer: OpinionSerializer
  has_many :tags, serializer: TagSerializer
end
