class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      
      t.string  :name,    null: false, default: ""
      t.string  :shipping_postal_code,     null: false, default: ""
      t.text    :shipping_address,       null: false, default: ""

      t.timestamps
    end
  end
end
