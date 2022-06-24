class Public::CartsController < ApplicationController
before_action :set_line_item, only: [:add_item, :destroy]
before_action :set_customer
before_action :set_cart

  def show
    @line_items = @cart.line_items
  end

  def add_item
    @line_item = @cart.line_items.build(item_id: params[:item_id]) if @line_item.blank?
    @line_item.quantity += params[:quantity].to_i
    if @line_item.save
      redirect_to current_cart
    else
      redirect_to controller: "itemts", action: "show"
    end
  end

  def destroy
    @cart.destroy
    redirect_to current_cart
  end

  private
  def set_customer
    @customer = current_customer
  end

  def set_line_item
    @line_item = current_cart.line_items.find_by(item_id: params[:item_id])
  end

  def set_cart
    @cart = current_cart
  end
end
