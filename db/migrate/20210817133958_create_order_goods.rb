class CreateOrderGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :order_goods do |t|
      
      t.integer :goods_id, null: false #商品ID
      t.integer :order_id, null: false #注文ID
      t.integer :quantity, null: false, default: "" #商品個数
      t.integer :price, null: false, default: "" #購入時価格（税込）
      t.integer :production_status, null: false, default: "0" #製作ステータス
      

      t.timestamps
    end
  end
end
