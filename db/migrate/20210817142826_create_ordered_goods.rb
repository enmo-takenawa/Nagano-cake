class CreateOrderedGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_goods do |t|
      t.integer :goods_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :production_status, null: false, default:0

      t.timestamps
    end
  end
end
