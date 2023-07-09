class Order < ApplicationRecord
  has_many :ordered_details #中間テーブル
  has_many :items, through: :ordered_details  
  
  enum status: {
     "入金待ち":0, 
     "入金確認":1, 
     "製作中":2, 
     "発送準備中":3, 
     "発送済み":4
  }
enum payment_method: ["クレジットカード", "銀行振込"]
end
