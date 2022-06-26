class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]

  def top
    @items = Item.all.order(created_at: :asc)
    #=> :asc,古い順 :desc,新しい順　
    @genres = Genre.all
  end

	def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
	end

	def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart = Cart.new
	end

  def about
  end

	private
	def item_params
		parmas.require(:item).permit(:image ,:name, :description, :price, :is_active)
	end
  
end