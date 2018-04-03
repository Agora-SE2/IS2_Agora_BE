# == Schema Information
#
# Table name: project_tags
#
#  id             :integer          not null, primary key
#  tag_id         :integer
#  law_project_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ProjectTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :law_project
end
