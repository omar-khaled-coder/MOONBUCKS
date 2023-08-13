class Product < ApplicationRecord
  belongs_to :user
  # has_many :orders
  # has_many :users, through: :bookings
  has_many_attached :photos
  validates :price, presence: true, numericality: { greater_than: 0 }
end
