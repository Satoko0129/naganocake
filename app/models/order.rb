class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy #中間テーブル
  has_many :items, through: :ordered_details
  belongs_to :customer

  enum status: { waiting_for_payment: 0, payment_confirmation: 1, under_construction: 2, preparing_to_ship: 3, sent: 4}
  #status　→　注文ステータス
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  
end
