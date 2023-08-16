class OrdersController < ApplicationController
  before_action :authenticate_user! # Add authentication if required

  def create
    cart = current_user.cart
    cart_items = cart.cart_items.includes(:product)

    @order = current_user.orders.build

    cart_items.each do |cart_item|
      @order.order_items.build(
        product_id: cart_item.product_id,
        quantity: cart_item.quantity
      )
    end

    if @order.save
      cart_items.destroy_all  # Clear the cart after successful order creation
      redirect_to orders_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end



  def index
    # Your code to retrieve and display a list of orders
    @orders = Order.where(user_id: current_user.id)
  end

  private

  def order_params
    params.require(:order).permit(:number_of_items)
  end
end
