class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @carts = Carts.new
  end
end
