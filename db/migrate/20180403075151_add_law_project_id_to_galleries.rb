class AddLawProjectIdToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_reference :galleries, :law_project, foreign_key: true
  end
end
