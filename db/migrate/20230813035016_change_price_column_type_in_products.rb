class ChangePriceColumnTypeInProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :price, :integer, using: 'price::integer'
  end

  def down
    change_column :products, :price, :string
  end
end
