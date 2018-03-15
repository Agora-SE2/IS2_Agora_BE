class Tag < ActiveRecord::Base
    has_many :project_tags
    
    validates :name, :presence => true
end
