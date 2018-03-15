class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :content
      t.date :date
      t.integer :like
      t.boolean :pro
      t.integer :law_project_id

      t.timestamps null: false
    end
  end
end
