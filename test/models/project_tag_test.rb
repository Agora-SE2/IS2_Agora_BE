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

require 'test_helper'

class ProjectTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
