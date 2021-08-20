class CartItem < ApplicationRecord
    
    #商品が0の状態で保存変更されるのを防止
    #↓このバリデーションは時間あれば実装する。
    #validates :quantity, presence: true
    
    belongs_to :customer
    belongs_to :goods
    
    def total_price
        good.price * quantity
    end

end
