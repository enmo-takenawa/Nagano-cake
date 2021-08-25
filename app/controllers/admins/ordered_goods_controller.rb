class Admins::OrderedGoodsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @ordered_good = OrderedGood.find(params[:id])
    if @ordered_good.update(production_status: params[:ordered_good][:production_status].to_i)
      if @order.ordered_goods.find_by(production_status: 2)
        @order.update(order_status: 2)
      end

      if @order.ordered_goods.find_by(production_status: 0).nil? && @order.ordered_goods.find_by(production_status: 1).nil? && @order.ordered_goods.find_by(production_status: 2).nil?
        @order.update(order_status: 3)
      end
      redirect_to admins_order_path(@order.id)
    end
  end

  private

  def order_good_params
    params.require(:ordered_good).permit(:production_status)
  end

end
