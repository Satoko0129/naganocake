class Public::ItemsController < ApplicationController

  def index
    @total_items = Item.all
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



  private
  def items_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image_id)
  end
end
