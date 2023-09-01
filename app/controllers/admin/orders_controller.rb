class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = OrderDetail.where(order_id: params[:id])
    flash[:notice] = "注文ステータスを変更しました"

    if @order.status_i18n == "入金確認"
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end

    elsif @order.status_i18n == "制作中"
      @order_details.each do |order_detail|
        order_detail.update(making_status: 2)
      end


    end
     redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end