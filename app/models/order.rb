class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :order_items
  has_many :products, through: :cart_items
end
