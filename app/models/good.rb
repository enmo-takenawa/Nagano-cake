class Good < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :ordered_goods, dependent: :destroy
  
  belongs_to :genre
  
  attachment :image
  
  validates :name, :introduction, :genre_id, :price, presence: true
  validates :price, numericality: { only_integer: true }
  #価格に数値のみの入力許可のバリデーション、integerのみ
  

end
