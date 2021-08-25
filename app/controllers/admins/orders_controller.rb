class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    #@ordered_goods = OrderedGood.find(params[:id])
    @order.shipping_fee = 800
    @array_order_status = Array.new
    @array_order_status.push(["入金待ち",0],["入金確認",1],["製作中",2],["発送準備中",3],["発送済み",4])
    @array_ordered_good_production_status = Array.new
    @array_ordered_good_production_status.push(["着手不可",0],["制作待ち",1],["製作中",2],["製作完了",3])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_status: params[:order][:order_status].to_i)
      if Order.order_statuses[@order.order_status] == 1
        @order.ordered_goods.each do|f|
          f.update(production_status: 1)
        end
      end
      redirect_to request.referer
    end
  end

  private
  #def order_params
    #params.require(:order).permit(:order_status) #permitの中身記述途中
  #end

end
