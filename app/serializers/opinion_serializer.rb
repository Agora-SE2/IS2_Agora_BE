class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :like, :pro
  
  has_one :user, serializer: OpinionAuthorSerializer
end
