class OrderGood < ApplicationRecord
  
  validates :quantity, presence: true #数量が空かどうか
  validates :price, presence: true #購入時金額が空かどうか
  validates :production_status, presence: true 
  
  belongs_to :order
  belongs_to :good
  
enum production_status: {着手不可:0,制作待ち:1,製作中:2,製作完了:3}
end
