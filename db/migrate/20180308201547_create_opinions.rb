class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :content
      t.date :date
      t.integer :like
      t.boolean :pro
      t.references :law_project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
