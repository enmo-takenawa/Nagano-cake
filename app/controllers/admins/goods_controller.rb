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
  end

  def edit
  end

  def update
  end
  
  private
  def item_params
    params.require(:good).permit(:name, :genre_id, :introduction, :price, :is_active, :image)
  end
    
  
end
