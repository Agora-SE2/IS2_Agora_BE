class CreateFeaturedProjects < ActiveRecord::Migration
  def change
    create_table :featured_projects do |t|
      t.integer :year
      t.integer :week
      t.integer :day
      t.integer :law_project_id

      t.timestamps null: false
    end
  end
end
