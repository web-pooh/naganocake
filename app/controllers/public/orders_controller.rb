class Public::OrdersController < ApplicationController
#管理者とログインユーザーのみ閲覧可
	before_action :authenticate!
#退会済みユーザーは閲覧不可
 	before_action :customer_is_deleted
#param[:id]が取得できない場合、閲覧不可
 	before_action :params_check, only: [:index]
  #customer購入情報の入力画面

  def new
    @customer = current_user
    if @customer.cart_items.blank?
      flash[:warning] = "カートが空です"
       redirect_to cart_items_path
    else
       @order = Order.new(customer_id: @customer.id)
       @ads = @customer.ship_to_addresses
       @ship_to_address = ShipToAddress.new(customer_id: @customer.id)
    end
  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
