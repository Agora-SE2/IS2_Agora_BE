class ProjectTag < ApplicationRecord
    
  belongs_to :tags
  belongs_to :law_projects
    
end
