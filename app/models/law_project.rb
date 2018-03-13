class LawProject < ActiveRecord::Base
    has_many :project_tags
    has_many :opinions
    has_many :galleries
    has_many :featured_projects
end
