class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :products
  belongs_to :product
  has_many :order_items
end
