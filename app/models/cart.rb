class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products

  # def add_product(product)
  #   cart_item = cart_items.find_or_initialize_by(product: product)
  #   cart_item.quantity ||= 0  # Initialize quantity to 0 if it's nil
  #   cart_item.quantity += 1
  #   cart_item.save
  # end
end
