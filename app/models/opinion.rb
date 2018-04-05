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
    validates :like, :presence => true, :format => {:with => /\A\d+\z/, :message => "el campo \"likes\" no tiene el formato correcto, inténtelo de nuevo."}
    
    scope :pro_opinions, -> { where(pro: true) }
    scope :pro_opinions_by_id, -> (project){ where(pro: true, law_project_id: project) }
    scope :against_opinions_by_id, -> (project){ where(pro: false, law_project_id: project) }
    scope :against_opinions, -> { where(pro: false) }
    scope :only_content, -> { select("content") }
    scope :content_pro, -> { where(pro: true).pluck(:content) }
    scope :content_against, -> { where(pro: false).pluck(:content) }
end
