class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :shipping_postal_code #郵便番号
      t.string :shipping_address #住所
      t.string :shipping_name #氏名
      t.integer :shipping_fee #送料
      t.integer :total_price #請求金額
      t.integer :payment_method #支払方法
      t.integer :order_status #注文ステータス
      

      t.timestamps
    end
  end
end
