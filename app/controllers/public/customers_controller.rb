class Public::CustomersController < ApplicationController
  def show
    
  end
  
  def edit
  end
  
  def unsubscribe
    @customer = Customer.find_by(name: params[:name])
    @user.update(is_valid: false)
    resent_session
    redirect_to root_path
  end
  
  
end
