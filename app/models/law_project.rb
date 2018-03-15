class LawProject < ActiveRecord::Base
    has_many :project_tags
    has_many :opinions
    has_many :galleries
    has_many :featured_projects
    
    validates :name, :presence => true
    validates :description, :presence => true
    validates :publication_date, :presence => true
    validates :yes_votes, :presence => true
    validates :not_votes, :presence => true
end
