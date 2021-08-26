class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}

  has_many :shipping_addresses
  has_many :orders #through: :ordered_good
  has_many :cart_items
  
  def inactive_message
    self.is_deleted? ? super : :special_condition_is_not_valid
  end
  
  def active_for_authentication?
    super && self.is_deleted?
  end
  
end
