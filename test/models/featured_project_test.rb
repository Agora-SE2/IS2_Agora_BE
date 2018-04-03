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

require 'test_helper'

class FeaturedProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
