class Tag < ActiveRecord::Base
    has_many :project_tags
end
