class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy #中間テーブル
  has_many :items, through: :ordered_details
  belongs_to :customer

  enum status: {"入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4}
  #status　→　注文ステータス
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  
  def full_address
    
  end
end
