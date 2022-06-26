class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def bye
    @customer = current_customer
  end
  
  def update
     @customer = current_customer
     if @customer.update(customer_params)
       flash[:notice] = "会員情報の編集に成功しました."
       redirect_to customers_my_page_path
     else
       flash[:alart] = "会員情報の編集に失敗しました"
       render "edit"
     end
  end
  
  def adios
    @customer = current_customer
    @customer.update(is_deletede: false)
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :addresse, :phone_numbere, :email)
  end
end
