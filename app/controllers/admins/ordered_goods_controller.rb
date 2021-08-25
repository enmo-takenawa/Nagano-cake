class Admins::OrderedGoodsController < ApplicationController

  def update
    order_good = OrderedGood.find(params[:id])
    order_good.update(production_status: params[:ordered_good][:production_status].to_i)
    if params[:ordered_good][:production_status].to_i == 2
      order_good.order.update(order_status: 2)
    elsif order_good.order.ordered_goods.count == order_good.order.ordered_goods.where(production_status: 3).count
      order_good.order.update(order_status: 3)
    end
    redirect_to admins_order_path(order_good.order.id)

  end

end
