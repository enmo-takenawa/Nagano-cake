class Admins::OrdersController < ApplicationController
  
  def index
    @ordered_goods =Ordered_goods.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @goods = @order.ordered_goods #goodsを複数形として扱っています
  end

  def updated
    @order = Order.find(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status) #permitの中身記述途中
  end

end
