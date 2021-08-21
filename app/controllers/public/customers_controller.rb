class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, {only: [:show, :edit]}
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def unsubscribe
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    resent_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:is_enabled, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :telephone_number, :email, :password, :postal_code, :address)
  end
  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    if current_customer.id != @customer.id
       redirect_to root_path
    end
  end
end
