class Item < ApplicationRecord
  has_one_attached :image
  has_many :carts, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  def with_tax_price
    (price * 1.1).floor
  end

end
