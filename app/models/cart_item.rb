class CartItem < ApplicationRecord
  
  #アソシエーション(1:NのNの方)
  belongs_to :customer
  belongs_to :item
end
