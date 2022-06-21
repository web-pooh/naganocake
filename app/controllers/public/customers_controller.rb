class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def bye
    @customer = current_customer
  end
  
  def update
     @costomer = Customer.find(params[:id])
     if @customer.update(customer_params)
       flash[:notice] = "会員情報の編集に成功しました."
       redirect_to customer_path(current_user)
     else
       flash[:alart] = "会員情報の編集に失敗しました"
       render "edit"
     end
  end
  
  def adios
    @customer = Customer.find(params[:id])
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:cutomer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :addresse, :phone_numbere, :email)
  end
end
