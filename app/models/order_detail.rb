class OrderDetail < ApplicationRecord
  enum making_status: { impossible: 0, waiting: 1, making: 2, done: 3 }
  belongs_to :item
  belongs_to :order

  def subtotal
    item.with_tax_price * amount
  end


end
