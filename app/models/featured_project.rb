class FeaturedProject < ActiveRecord::Base
    has_many :law_project
    
    validates :year, :presence => true
    validates :week, :presence => true
    validates :day, :presence => true
end
