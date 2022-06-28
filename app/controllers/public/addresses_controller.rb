class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])  
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
     flash[:notice] = "新規登録に成功しました"
     redirect_to addresses_path
    else
     flash[:notice] = "新規登録に失敗しました"
     redirect_to addresses_path 
    end
  end
  
  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])  
    address.destroy  
    redirect_to addresses_path 
  end
  
  private
  def address_params
    params.require(:address).permit(:user_id, :postel_code, :address, :receiver_name)
  end

end
