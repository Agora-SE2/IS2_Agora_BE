class FeaturedProject < ActiveRecord::Base
    belongs_to :law_project
    
    validates :year, :presence => true
    validates :week, :presence => true
    validates :day, :presence => true
end
