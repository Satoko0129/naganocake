class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
