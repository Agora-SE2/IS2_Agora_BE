class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birth_name, :string
    add_column :users, :user_name, :string
    add_column :users, :description, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
