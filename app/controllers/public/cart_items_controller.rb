class Public::CartItemsController < ApplicationController
  def index
   #@cart_items = CartItem.new
    @cart_items = current_customer.cart_items
  end

  def update
    cart_items = current_customer.cart_items
    cart_item = cart_items.find_by(good_id: params[:cart_item][:good_id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    #@cart_items = current_customer.cart_items
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:good_id, :quantity)
  end

end
