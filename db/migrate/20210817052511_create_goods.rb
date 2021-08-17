class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.integer :genre_id
      t.integer :sales_status
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.timestamps
    end
  end
end
