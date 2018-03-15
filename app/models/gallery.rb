class Gallery < ActiveRecord::Base
    belongs_to :law_project
    
    validates :route, :presence => true
end
