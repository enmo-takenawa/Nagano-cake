class Public::GoodsController < ApplicationController
  def index
    @goods = Good.page(params[:page]).per(8).reverse_order
    
  end
  
  def show
    @good = Good.find(params[:id])
    @cart_item = CartItem.new
  end
end
