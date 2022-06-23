class Public::CartsController < ApplicationController
   before_action :set_cart_item, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @carts = current_cart
  end


  private

  def params_cart_item
    params.require(:cart).permit(:quantity, :item_id)
  end
end
