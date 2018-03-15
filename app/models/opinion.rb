class Opinion < ActiveRecord::Base
    belongs_to :law_project
    
    validates :content, :presence => true
    validates :date, :presence => true
    validates :like, :presence => true
    validates :pro, :presence => true
end
