class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirm: 1, making: 2, prepare: 3, done: 4 }
  
   belongs_to :customer
   has_many :order_details, dependent: :destroy
   
  def total_amount
    sum=0
    order_details.each do |order_detail|
      sum+=order_detail.amount
    end
    return sum
  end

  def item_total_price
    sum=0
    order_details.each do |order_detail|
      sum+=order_detail.subtotal
    end
    return sum
  end
  
end
