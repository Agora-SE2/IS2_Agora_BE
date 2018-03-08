class CreateLawProjects < ActiveRecord::Migration
  def change
    create_table :law_projects do |t|
      t.string :name
      t.string :description
      t.date :publication_date
      t.integer :yes_votes
      t.integer :not_votes

      t.timestamps null: false
    end
  end
end