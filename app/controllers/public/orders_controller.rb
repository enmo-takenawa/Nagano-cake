class Public::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @goods = @order.ordered_goods #goodsを複数形として扱っています
  end

  def updated
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.new
    @order.customer_id = current_customer.id
  end
  
  def confirmation
  end
  
  def success
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status) #permitの中身記述途中
  end

end
