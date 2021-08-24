class Public::ShippingAddressController < ApplicationController
  def new
    @shipping_adress_new = ShippingAddress.new
    @shipping_adress = current_customer.shipping_address
    @shipping_addresses = ShippingAddress.all
        
  end
    
  def create
        @shipping_address = ShippingAddress.new(shipping_address_strong)
        @shipping_address.customer_id = current_customer.id
        @shipping_addresses = ShippingAddress.all
        if @shipping_address.save
          redirect_to shipping_address_path
        else
          @shipping_address_new = ShippingAddress.new
          @shipping_address = current_customer.shipping_address
          render :new
        end
  end
    
  def edit
        @shipping_address = ShippingAddress.find(params[:id])
        
  end
    
  def update
        @shipping_address = ShippingAddress.find(params[:id])
        if @shipping_address.update(shipping_address_params)
          flash[:success] = '編集を保存しました'
          redirect_to shipping_address_path
        else
        @shipping_address = ShippingAddress.find(params[:id])
        flash[:danger] = '必要情報を入力してください／ハイフンは使用できません'
        render :edit
        end
  end
    
  def destroy

        @shipping_address = ShippingAddress.find(params[:id])
        @shipping_address.destroy
        redirect_to shipping_address_path
  end
  
  private
  def shipping_address_params
    params.require(:shipping_address).permit(:name, :shipping_postal_code, :shipping_address)
  
  end
  def shipping_address_strong
    params.permit(:name, :shipping_postal_code, :shipping_address)
  end
end