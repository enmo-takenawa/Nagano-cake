class Admins::OrdersController < ApplicationController

  def index
    @ordered_goods = OrderedGood.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    #@ordered_goods = OrderedGood.find(params[:id])
    @order.shipping_fee = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status: params[:order][:order_status].to_i)
    if params[:order][:order_status].to_i == 1
      @order.ordered_goods.update_all(production_status: 1)
    elsif params[:order][:order_status].to_i == 4
      @order.ordered_goods.update_all(production_status: 3)
    end
    redirect_to admins_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:order_status) #permitの中身記述途中
  end

end
