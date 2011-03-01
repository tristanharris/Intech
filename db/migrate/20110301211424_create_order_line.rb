class CreateOrderLine < ActiveRecord::Migration
  def self.up
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :order_lines
  end
end
