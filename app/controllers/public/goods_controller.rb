class Public::GoodsController < ApplicationController
  def index
    active_goods = Good.where(sales_status: false)
    @goods = Good.page(params[:page]).per(8).reverse_order
    @goods_count = active_goods.count
    @genres = Genre.all

  end

  def show
    @good = Good.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
