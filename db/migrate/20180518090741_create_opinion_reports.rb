class CreateOpinionReports < ActiveRecord::Migration[5.0]
  def change
    create_table :opinion_reports do |t|
      t.references :opinion, foreign_key: true
      t.string :reason
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
