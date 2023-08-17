class Product < ApplicationRecord
  belongs_to :user
  # has_many :orders
  # has_many :users, through: :bookings
  has_many_attached :photos
  has_many :order_items
  has_many :orders, through: :order_items
  validates :price, presence: true, numericality: { greater_than: 0 }
end
