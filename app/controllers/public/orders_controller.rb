class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    if @order.save
      @cart_items=current_customer.carts
      @cart_items.each do |carts|
        order_detail=OrderDetail.new(item_id: carts.item.id, order_id: @order.id, price: cart_item.item.price, billing_amount: cart_item.amount)
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to thanks_path
    else
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items=current_customer.carts.all
    @total_price=0
    if params[:order][:select_address]=="0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address]=="1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end
  

  def thanks
  end

  def index
     @orders = current_customer.orders.order("created_at DESC").page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
		@order_details = @order.order_details
  end
	
private
  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postal_code, :address, :receiver_name, :billing_amount, :postage, :status)
  end
end