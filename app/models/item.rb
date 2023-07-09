class Item < ApplicationRecord
  has_many :ordered_details #中間テーブル
  has_many :orders, through: :ordered_details 
end
