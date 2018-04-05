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
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LawProject < ActiveRecord::Base
    has_many :tags
    has_many :opinions
    has_many :galleries 
    belongs_to :featured_projects
    
    validates :name, :presence => true
    validates :description, :presence => true
    validates :publication_date, :presence => true
    validates :yes_votes, :presence => true
    validates :not_votes, :presence => true
    
    scope :recents, -> { where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight) }
    scope :name_recents, -> { where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight).pluck(:name) }
    scope :name_and_votes, -> { select("content","yes_votes","not_votes") }
    
end
