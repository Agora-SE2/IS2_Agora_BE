# == Schema Information
#
# Table name: opinion_reports
#
#  id         :integer          not null, primary key
#  opinion_id :integer
#  reason     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OpinionReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
