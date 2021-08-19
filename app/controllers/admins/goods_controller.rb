class Admins::GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def new
  end

  def create
  end

  def show
    @good = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    @good.update(good_params)
    redirect_to admins_good_path(@good.id)
  end
  
  private
  def good_params
    params.require(:good).permit(:name, :introduction, :genre_id, :price, :sales_status)
  end

end
