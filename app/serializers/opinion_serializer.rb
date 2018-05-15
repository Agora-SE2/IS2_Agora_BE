class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :like, :pro
  
  belongs_to :user, serializer: OpinionAuthorSerializer
end
