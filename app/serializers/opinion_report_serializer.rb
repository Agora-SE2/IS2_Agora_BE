# == Schema Information
#
# Table name: opinion_reports
#
#  id         :integer          not null, primary key
#  opinion_id :integer
#  reason     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OpinionReportSerializer < ActiveModel::Serializer
  attributes :id, :reason
  has_one :opinion
  has_one :user
end
