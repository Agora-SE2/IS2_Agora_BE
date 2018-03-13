class CreateFeaturedProjects < ActiveRecord::Migration
  def change
    create_table :featured_projects do |t|
      t.integer :year
      t.integer :week
      t.integer :day
      t.references :law_project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
