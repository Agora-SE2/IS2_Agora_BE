class OpinionReportSerializer < ActiveModel::Serializer
  attributes :id, :reason
  has_one :opinion
  has_one :user
end
