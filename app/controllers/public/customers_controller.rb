class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, {only: [:show, :edit]}
  before_action :reject_inactive_customer, only: [:create]
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "会員情報の更新に成功しました！"
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def switch
    @customer = Customer.find(params[:id])
    if @customer.update(is_deleted: false)
      sign_out current_customer
    end
    redirect_to root_path
  end
  
  def reject_inactive_customer
    @customer = Customer.find_by(name: params[:customer][:email])
    if @customer
      if @customer.delete_password?(params[:customer][:password]) && !@customer.is_deleted
        redirect_to new_customer_session_path
      end
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :telephone_number, :email, :password, :postal_code, :address)
  end
  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    if current_customer.id != @customer.id
       redirect_to root_path
    end
  end
end
