class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer=Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :lastname_kana, :first_kana, :email, :postal_code, :address, :phone_number, :is_deleted )
  end
end
