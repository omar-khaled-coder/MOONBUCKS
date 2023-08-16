class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :order_id
      t.string :identification_number
      t.integer :number_of_items

      t.timestamps
    end
  end
end
