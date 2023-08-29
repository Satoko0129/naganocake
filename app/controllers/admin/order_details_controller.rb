class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update

    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.find(params[:id])
    @order_details = @order.order_details.all


    @order_detail.update(order_detail_params)


    if @order_detail.making_status == "制作中"
      @order.update(status: 2)
      flash[:notice] = "制作ステータスを更新しました。"
      @order.save
    end

    if @order.order_details.count == @order.order_details.where(making_status: 3).count
      @order.update(status: 3)
      flash[:notice] = "制作ステータスを更新しました。"
      @order.save
    end
    redirect_to request.referer
      #遷移前のURLを取得する

  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
