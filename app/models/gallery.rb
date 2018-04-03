# == Schema Information
#
# Table name: galleries
#
#  id             :integer          not null, primary key
#  route          :string
#  law_project_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Gallery < ActiveRecord::Base
    belongs_to :law_project, polymorphic: true
    
    validates :route, :presence => true
end
