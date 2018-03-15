class Gallery < ActiveRecord::Base
    belongs_to :law_project, polymorphic: true
    
    validates :route, :presence => true
end
