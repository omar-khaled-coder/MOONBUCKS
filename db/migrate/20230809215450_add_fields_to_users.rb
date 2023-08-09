class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :identification_number, :string
    add_column :users, :address, :string
    add_column :users, :contact_number, :string
  end
end
