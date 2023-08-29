class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: {
    cannot_start:0, 
    waiting_for_production:1, 
    under_construction:2, 
    production_completed:3
  }
  #making_status → 製作ステータス
  
  def sum_of_price
    item.tax_in_price * quantity
  end
end
