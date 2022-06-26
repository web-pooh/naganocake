class Address < ApplicationRecord
  belongs_to :customer
  
  def address_info
    "〒" + self.postel_code + " " + self.address + "　" + self.receiver_name
  end
end
