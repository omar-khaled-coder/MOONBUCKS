class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart
    cart_items = cart.cart_items.includes(:product)

    @order = current_user.orders.build
    @order.number_of_items = cart_items.sum(:quantity)

    if @order.save
      cart_items.each do |cart_item|
        @order.order_items.create(
          product_id: cart_item.product_id,
          quantity: cart_item.quantity
        )
      end

      cart_items.destroy_all
      redirect_to orders_path, notice: 'Order was successfully created.'
    else
      redirect_to basket_path, alert: 'Failed to create order.'
    end
  end

  def index
    @orders = current_user.orders.includes(order_items: :product)
  end
end
