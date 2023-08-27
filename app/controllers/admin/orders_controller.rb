class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  if @order.update(order_params)
    @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    ## 1.注文ステータスが「入金確認」のとき、製作ステータスを全て「製作待ち」に更新する
  end
    redirect_to admin_order_path(@order)
  end


private
def order_params
  params.require(:order).permit(:status)
end
end
