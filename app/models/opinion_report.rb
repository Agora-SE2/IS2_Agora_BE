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

class OpinionReport < ApplicationRecord
  belongs_to :opinion
  belongs_to :user
  
  validates :opinion, :presence => true
  validates :user, :presence => true
  validates :reason, :presence => true
  
  scope :repeat, -> (opinion,user){ where(opinion_id: opinion, user_id: user) }
end
