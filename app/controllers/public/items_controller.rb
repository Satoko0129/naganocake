class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
