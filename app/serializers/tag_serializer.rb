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

class TagSerializer < ActiveModel::Serializer
  attributes :name
end
