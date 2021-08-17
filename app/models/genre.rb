class Genre < ApplicationRecord
    has_many :goods, dependent: :destroy
end
