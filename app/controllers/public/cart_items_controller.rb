class Public::CartItemsController < ApplicationController

  def subtotal
    item.with_tax_price * amount
  end

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    #カートに入っている商品の合計金額。カート内商品の一覧画面で、カート内商品の合計金額を算出。
    #inject・・・eachやmapのように繰り返しを行うメソッド。
    #inject(0)・・・配列の合計を算出。　配列オブジェクト.inject { |初期値, 要素| ブロック処理 }　が基本の形
    #1回目の動作・・・@cart_itemsから、カートに入っている1つ目のitemを取り出して、sumにitem.sum_of_priceを足す。(sumの初期値はinject(0)で0)
    #2回目以降のづ動作・・・次のitemを取り出して、sumにitem.sum_of_priceを足す。これで最終的にカート内商品の合計金額が出る。
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(params_cart_item) #Cart_itemの新規投稿。ストロングパラメーターで、個数、item_id、customer_idを受け取っている。
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all #ここで、カートに入っているものを取り出している。

      @cart_items.each do |cart_item| #カートの中身を一個ずつ取り出して、
        if cart_item.item_id == @cart_item.item_id #もし、同じ商品が存在していれば、
        new_amount = cart_item.amount + @cart_item.amount #今の個数に足す。それを、new_amountに代入
        cart_item.update_attribute(:amount, new_amount) #cart_itemモデルのamountをnew_acountに更新するよ
        @cart_item.delete #同一商品に関しては、個数だけ更新出来たら後は消去
        end
      end

      @cart_item.save
      redirect_to cart_items_path, notice: "カートに商品が入りました"
  end


  private
    def params_cart_item
      params.require(:cart_item).permit(:amount, :item_id, :customer_id)
    end
end
