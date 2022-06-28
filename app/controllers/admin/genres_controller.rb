class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!, except: [:show]

  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page]).per(10)
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all.page(params[:page]).per(10)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admin_genres_path
    else
       flash[:notice] = "ジャンルを追加できませんでした"
       render :index 
    end
  end

  def show
    @items = Item.all.all.page(params[:page]).per(10)
    @genre = Genre.find(params[:id])
    @genres = @genre.items.order(created_at: :desc).all.page(params[:page]).per(5)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to admin_genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
