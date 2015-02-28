class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :buyer
      t.string  :description
      t.float   :unit_price
      t.float   :total_price
      t.integer :quantity
      t.string  :address
      t.string  :supplier

      t.timestamps null: false
    end
  end
end
