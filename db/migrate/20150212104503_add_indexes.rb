class AddIndexes < ActiveRecord::Migration
  def change
    add_index :orders, :buyer
    add_index :orders, :supplier
    add_index :orders, :total_price
  end
end
