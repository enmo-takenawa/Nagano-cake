class Order < ApplicationRecord
  has_many :customers
  belongs_to :ordered_goods
  
  VALID_POSTAL_CODE_REGEX = /^\d{7}$/
  validates :shipping_postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
end
