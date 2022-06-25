class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    
  end

  def edit
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :lastname_kana, :first_kana, :email, :postal_code, :address, :phone_number, :is_deleted )
  end
end
