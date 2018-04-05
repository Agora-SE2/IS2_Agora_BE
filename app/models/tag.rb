# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string
#  icon_route     :string
#  law_project_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Tag < ActiveRecord::Base
    has_many :project_tags
    
    validates :name, :presence => true
    
    scope :recents, -> { where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight) }
end
