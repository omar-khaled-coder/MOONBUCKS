class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
    # Add any code here to display the order details if needed
  end

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
    if current_user.id == 1
      @orders = Order.includes(:user, order_items: :product).all
    else
      @orders = current_user.orders.includes(order_items: :product)
    end
  end


  def destroy
    @order = Order.find(params[:id])
    @order.order_items.destroy_all
    @order.destroy

    redirect_to orders_path, notice: 'Order was successfully deleted.'
  end



  # def remove_from_order
  #   @order = current_user.orders.find_by(id: params[:order_id])

  #   if @order
  #     @order_item = @order.order_items.find_by(id: params[:order_item_id])

  #     if @order_item
  #       @order_item.destroy
  #     end
  #   end

  #   redirect_to orders_path, notice: 'Item was successfully removed from the order.'
  # end

end
