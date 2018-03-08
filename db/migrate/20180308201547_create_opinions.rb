class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :content
      t.date :date
      t.integer :like
      t.boolean :pro

      t.timestamps null: false
    end
  end
end
