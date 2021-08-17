class ShippingAddressController < ApplicationController
    
    def index
        @shipping_adress = current_customer.shipping_address
        @shipping_adress_new = Shipaddress.new
        
        
    end
    
    def show
        @shipping_address = Shipingaddress.find(params[:id])
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @shipping_address = Shipingaddress.find(params[:id])
        
    end
    
    def update
        shipping_address = ShippingAddress.find(params[:id])
        shipping_address.update(shipping_address_params)
        redirect_to shipping_address_path
    end
    
    def destroy
        shipping_address = ShippingAddress
        shipping_address.destroy
        redirect_to shipping_address_path
    end
    
    

end
