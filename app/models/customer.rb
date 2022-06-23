class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #空欄禁止のバリデーション
　validates :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, {presence: true}
　#文字数指定のバリデーション
　validates :first_name, :last_name, :first_name_kana, :last_name_kana, :address, {length: {in: 1..50} }
　validates :postal_code, {lengh: {is: 7} } #郵便番号は7桁のみ
　validates :phone_number, {lengh: {in: 10..11} } #電話番号は10~11桁のみ
　
  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
end
