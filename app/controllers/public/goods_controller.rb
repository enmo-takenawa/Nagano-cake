class Public::GoodsController < ApplicationController
  def index
    @goods = Good.page(params[:page]).per(8).reverse_order
  end
  
  def show
  end
end
