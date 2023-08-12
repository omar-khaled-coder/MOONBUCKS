class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :identification_number
      t.string :address
      t.string :contact_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
