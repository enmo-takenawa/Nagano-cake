class Admins::GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
    @genres = Genre.all
  end

  def create
    @good = Good.new(good_params)
    @good.save
    redirect_to admins_good_path(@good.id)
  end

  def show
    @good = Good.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def good_params
    params.require(:good).permit(:name, :genre_id, :introduction, :price, :sales_status, :image)
  end


end
