class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
		@order_details = @order.order_details
  end
  
  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    order.update(order_params)
    if 
      order.order_status == "入金確認"
      order_details.update_all(making_status: "製作待ち")
    else
      redirect_to admins_order_path(order.id)
    end
  end

  private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
