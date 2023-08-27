class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :log, :create, :index, :show, :thanks]

  def new  #注文情報入力画面(支払方法)
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def log  #注文情報確認画面
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)

    if params[:order][:address_type] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

    # [:address_type]=="1"を呼び出す
    elsif params[:order][:address_type] == "1"
        ship = Address.find(params[:order][:customer_id])
        #orderのcustomer_idでアドレス帳を選び、そのデータ送る
        @order.postal_code = ship.postal_code
        @order.address = ship.address
        @order.name = ship.name
    end


    @total = 0
  end

  def thanks  #注文完了画面
  end

  def create  #注文確定処理
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.save
    end

    current_customer.cart_items.destroy_all

    redirect_to orders_thanks_path
  end

  def index  #注文履歴画面
    @orders = current_customer.orders.page(params[:page]).per(10)
  end

  def show  #注文履歴詳細画面
    @order = Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
  end



  private
    #Strong Parameters
    def order_params
        params.require(:order).permit(:postage, :method_of_payment, :name, :address, :postal_code, :customer_id, :total_amount_billed, :status)
    end

end
