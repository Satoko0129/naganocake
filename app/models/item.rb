class Item < ApplicationRecord
  has_many :orders, through: :order_details #order_detailsを経由してordersのオブジェクトを取得する
  has_many :order_details #中間テーブル　※throughオプションを使うときに必要
  belongs_to :genre
end
