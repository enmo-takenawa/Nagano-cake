class Admins::OrdersController < ApplicationController
  
  def index
    @order = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_goods = OrderedGood.all
  end

  def updated
    @order = Order.find(params[:id])
    @order.update
    redirect_to admins_order_path(@order.id)
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status) #permitの中身記述途中
  end

end
