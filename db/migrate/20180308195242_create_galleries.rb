class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :route
      t.references :law_project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
