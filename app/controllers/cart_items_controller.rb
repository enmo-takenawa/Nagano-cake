class CartItemsController < ApplicationController
    
    def show
        @customer = Customer.find(params[:id])
        
    end
    
    def update
    end
    
    def create
    end
    
    def destroy
    end
    
    def destroy_all
    end
    
    
    
    
end
