class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :shipping_fee
      t.integer :total_price
      t.integer :payment_method
      t.integer :order_status
      

      t.timestamps
    end
  end
end
