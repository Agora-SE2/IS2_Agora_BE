class CreateProjectTags < ActiveRecord::Migration
  def change
    create_table :project_tags do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :law_project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
