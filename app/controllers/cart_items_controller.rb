class CartItemsController < ApplicationController
    
    def index
        @customer = Customer.find(params[:id])
        @goods = Goods.all
    end
    
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        
    end
    
    def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end

    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_item_path
    end
    
    def destroy_all
        current_customer.cart_items.destroy_all
        redirect_to cart_items_path
    end
    

end
