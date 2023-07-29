class CartItem < ApplicationRecord
  
    #アソシエーション(1:NのNの方)
    belongs_to :customer
    belongs_to :item
    
    validates :item_id, :amount, presence: true 
    #presenceヘルパー => 一番多く使うヘルパーです。定義すると「空でないか」を検証します。
    #上記のように記述すると、item_idカラム、amount(数量)カラムに値が入っているかを検証します。
    validates :amount, numericality:{ only_integer:true }
  
  
  def sum_of_price
    item.taxin_price * amount
  end
  #sum_of_priceで、商品の税込価格ｘ数量が出るようにしました。
  #taxin_priceは、item.rbで定義しています。
end
