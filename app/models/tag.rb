class Tag < ActiveRecord::Base
    has_many :project_tags
    has_many :law_projects, through: :project_tags
    
    validates :name, :presence => true
end
