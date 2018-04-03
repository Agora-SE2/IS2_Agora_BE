# == Schema Information
#
# Table name: opinions
#
#  id             :integer          not null, primary key
#  content        :string
#  date           :date
#  like           :integer
#  pro            :boolean
#  law_project_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Opinion < ActiveRecord::Base
    belongs_to :law_project
    
    validates :content, :presence => true
    validates :date, :presence => true
    validates :like, :presence => true
    validates :pro, :presence => true
end
