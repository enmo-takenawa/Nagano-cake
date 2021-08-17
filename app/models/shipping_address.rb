class ShippingAddress < ApplicationRecord
    
    #バリデーション、苗字、名前、郵便番号、住所
    validates :last_name, presence: true
    validates :first_name, presence: true
    #郵便番号の設定、ハイフンなし、七桁の数字
    validates :post_code, presence: true, format: {with: /\A\d{7}\z/}
    validates :address, presence: true
    
    belongs_to :customer
    
    
end
