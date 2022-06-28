class Address < ApplicationRecord
  belongs_to :customer
  
  validates :postel_code, presence: true
  validates :address, presence: true
  validates :receiver_name, presence: true
  
  def address_info
    "〒" + self.postel_code + " " + self.address + "　" + self.receiver_name
  end
end
