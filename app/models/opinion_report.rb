class OpinionReport < ApplicationRecord
  belongs_to :opinion
  belongs_to :user
  
  validates :opinion, :presence => true
  validates :user, :presence => true
  validates :reason, :presence => true
  
  scope :repeat, -> (opinion,user){ where(opinion_id: opinion, user_id: user) }
end
