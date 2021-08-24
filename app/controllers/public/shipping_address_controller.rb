class Public::ShippingAddressController < ApplicationController
  def new
    @shipping_adress_new = ShippingAddress.new
    @shipping_adress = current_customer.shipping_address
    @shipping_addresses = ShippingAddress.all
        
  end
    
  def create
        @shipping_address = ShippingAddress.new(shipping_address_params)
        @shipping_address.customer_id = current_customer.id
        if @shipping_address.save
          redirect_to shipping_address_path
        else
          @shipping_address_new = ShippingAddress.new
          @shipping_addresses = current_customer.shipping_addresses
          render :new
        end
  end
    
  def edit
        @shipping_address = ShippingAddress.find(params[:id])
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
  
  private
  def shipping_address_params
    params.require(:shipping_address).parmit(:last_name, :first_name, :postal_code, :address)
  
  end
end
