class Public::OrdersController < ApplicationController


  def new
    session.delete(:order)
    @order = Order.new
    @address = ShippingAddress.new
    @addresses = ShippingAddress.where(customer_id: current_customer.id) #登録済み住所
  end

  def confirmation
    @order = Order.new(payment_method: params[:order][:payment_method])
    session[:order] = @order

    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.shipping_fee = 800
    #送料定義　800円

    if params[:address] == "1"
      @order.shipping_name = current_customer.last_name + current_customer.first_name
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
    elsif params[:address] == "2"
      @order.shipping_name = ShippingAddress.find([:order][:address_id]).shipping_name
      @order.shipping_postal_code = ShippingAddress.find(params[:order][:address_id]).shipping_postal_code
      @order.shipping_address = ShippingAddress.find(params[:order][:address_id]).shipping_address
    elsif params[:address] == "3"
      @order.shipping_name = params[:shipping_name]
      @order.shipping_postal_code = params[:shipping_postal_code]
      @order.shipping_address = params[:shipping_address]
    end
  end


  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to success_orders_path

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderedGood.create(
        good_id: cart_item.good.id,
        order_id: @order.id,
        price: @order.total_price,
        quantity: cart_item.quantity,
        price_include_tax: add_tax_price(cart_item.good.price)
        )
    end
    @cart_items.destroy_all
  end

  def success
  end


  def index
    @orders = Order.where(customer_id: current_customer.id).reverse
  end

  def show
    @order = Order.find(params[:id])
    #@goods = @order.ordered_goods #goodsを複数形として扱っています
    @total_price = 0
  end


  private
  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :payment_method, :total_price, :shipping_fee, :order_status)
  end

end
