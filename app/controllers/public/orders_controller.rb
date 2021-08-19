class Public::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def create
    @order = Order.new
    @order.customer_id = current_customer.id
  end
  
  def show
    @order = Order.find(params[:id])
    @goods = @order.ordered_goods #goodsを複数形として扱っています
  end

  def updated
    @order = Order.find(params[:id])
  end
  
  def new
    @order = Order.new
    @shipping_address = ShippingAddress.new
    @address = current_customer.shipping_address.all
  end
  
  def confirmation
    if params[:shipping_address] == "1" #「ご自身の住所」を選択した場合
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.shipping_address
      
    elsif params[:shipping_address] == "2" #「登録済み住所から選択」を選んだ場合
      @order.name = ShippingAddress.find(params[:order][:select_address].to_i).name
      @order.postal_code = ShippingAddress.find(params[:order][:select_address].to_i).postal_code
      @order.shipping_address = ShippingAddress.find(params[:order][:select_address].to_i).shipping_address
      
    else #「新しいお届け先」を選んだ場合
      @shipping_address = ShippingAddress.new(address_params)
      @shipping_address.customer_id = current_customer.id
      @shipping_address.save
      
      @order.name = @shipping_address.name
      @order.postal_code = @shipping_address.postal_code
      @order.shipping_address = @shipping_address.shipping_address
      
    end
  end
  
  def success
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status) #permitの中身記述途中
  end

end
