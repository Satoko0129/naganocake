class Public::SearchesController < ApplicationController

  def genre_search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id) #itemの絞り込み
    @items = @items.page(params[:page]).per(6) #ページネーション用の定義
  end
end