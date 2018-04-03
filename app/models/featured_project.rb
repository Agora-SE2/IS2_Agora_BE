# == Schema Information
#
# Table name: featured_projects
#
#  id             :integer          not null, primary key
#  year           :integer
#  week           :integer
#  day            :integer
#  law_project_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FeaturedProject < ActiveRecord::Base
    has_many :law_project
    
    validates :year, :presence => true
    validates :week, :presence => true
    validates :day, :presence => true
end
