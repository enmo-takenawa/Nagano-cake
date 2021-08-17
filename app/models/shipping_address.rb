class ShippingAddress < ApplicationRecord
    
    #バリデーション、苗字、名前、郵便番号、住所
    validates :name, presence: true
    validates :address, presence: true
    validates :tel, presence: true
    
    belongs_to :customer
    
    
end
