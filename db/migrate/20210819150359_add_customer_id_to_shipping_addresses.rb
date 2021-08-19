class AddCustomerIdToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_addresses, :customer_id, :integer
    add_column :orders, :customer_id, :integer
    add_column :cart_items, :customer_id, :integer
    add_column :cart_items, :quantity, :integer
    add_column :cart_items, :goods_id, :integer
  end
end
