class Public::HomesController < ApplicationController
  def top
    @items = Item.all.page(params[:page]).per(10)
    @items = Item.order(created_at: :asc)#新着商品の更新。登録日時の若い順に昇順処理:asc
  end



  def about
  end
end
