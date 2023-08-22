class SearchesController < ApplicationController
  def genre_search
    @items = Item.where(genre_id: @genre_id)
  end
end
