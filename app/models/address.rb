class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :order
end
