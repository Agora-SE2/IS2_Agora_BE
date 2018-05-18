# == Schema Information
#
# Table name: law_projects
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :string
#  publication_date :date
#  yes_votes        :integer
#  not_votes        :integer
#  image            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class LawProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
