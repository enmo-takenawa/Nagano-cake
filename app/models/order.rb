class Order < ApplicationRecord
  has_many :customers
  belongs_to :ordered_goods

  validates :shipping_postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  #郵便番号　7桁（ハイフン無し）
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum sales_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

end
