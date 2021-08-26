class CartItem < ApplicationRecord
  #商品が0の状態で保存変更されるのを防止
  #↓このバリデーションは時間あれば実装する。
  validates :quantity, inclusion: { in: [1,2,3,4,5,6,7,8] }

  belongs_to :good
  belongs_to :customer
end
