class Public::HomesController < ApplicationController
  def top
    @items = Item.all.page(params[:page]).per(10)
  end



  def about
  end
end
