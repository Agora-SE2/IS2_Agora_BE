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

class LawProject < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    has_many :project_tags
    has_many :tags, through: :project_tags
    has_many :opinions
    has_many :galleries 
    belongs_to :featured_projects
    
    validates :name, :presence => true
    validates :description, :presence => true
    validates :publication_date, :presence => true
    validates :yes_votes, :presence => true, :format => {:with => /\A\d+\z/, :message => "el campo \"likes\" no tiene el formato correcto, inténtelo de nuevo."}
    validates :not_votes, :presence => true, :format => {:with => /\A\d+\z/, :message => "el campo \"likes\" no tiene el formato correcto, inténtelo de nuevo."}
    
    
    scope :recents, -> { where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight) }
    scope :name_recents, -> { where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight).pluck(:name) }
    scope :name_and_votes, -> { select("content","yes_votes","not_votes") }
    scope :order_by_upvotes, -> { order("yes_votes": :desc) }
    scope :order_by_downvotes, -> { order("not_votes": :desc) }
    scope :order_by_opinions, -> { select("law_projects.*, COUNT(opinions.id) as opinions_count").joins("LEFT OUTER JOIN opinions ON (opinions.law_project_id = law_projects.id)").group("opinions.law_project_id").order("opinions_count DESC") }
    scope :get_by_name, -> (name){where("lower(law_projects.name) LIKE ?", "%#{name.downcase}%")}
    scope :get_by_tag, -> (tag){joins(:tags).where(tags: { name: tag })}
    
end
