class Admin::ItemsController < ApplicationController
  #before_action :authenticate_admin!, only: [:create, :edit, :update, :index, :show, :new]

  def new
    @items = Item.page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の新規登録が完了しました。"#flash[:notice]は通知
      redirect_to admin_item_path(@item)
    else
      flash[:alert] = "商品の新規登録の内容に不備があります。" #flash[:alert]は警告
      render :new
    end
  end

  def index
  @items = Item.all.page(params[:page]).per(10) #ページに表示するレコード数の変更。1ページに10件のみレコードを表示
  end

  def show
    @item = Item.find(params[:id]) #findはモデルの検索機能を持つメソッド。モデルと紐づいているデータベースのテーブルから、レコードを1つ取り出す場合に使う。
  end                              #paramsとはRailsで送られてきた値を受け取るためのメソッド。

  def edit
    @item = Item.find(params[:id])
    @items = Genre.all
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
        flash[:notice] = "商品詳細の変更が完了しました。" #flash[:notice]は通知
        redirect_to admin_item_path(@item)
      else
        flash[:alert] = "商品詳細の変更に不備があります。" #flash[:alert]は警告
        render :edit
      end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end