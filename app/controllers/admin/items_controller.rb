class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
  end
  
   def create
    @item = Item.new(item_params)
    if @item.save!
     flash[:notice] = "新規登録に成功しました"
     redirect_to admin_item_path(@item.id)
    else
     flash[:notice] = "新規登録に失敗しました"
     render new_admin_item_path
    end
   end

  def show
      @item = Item.find(params[:id])
  end

  def edit
      @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id, :price, :is_active)
  end
end
