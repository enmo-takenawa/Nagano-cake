class Order < ApplicationRecord
  has_many :customers
  belongs_to :ordered_goods

  validates :shipping_postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  #郵便番号　7桁（ハイフン無し）
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true


end
