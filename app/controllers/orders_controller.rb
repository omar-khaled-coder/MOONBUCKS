class OrdersController < ApplicationController
  before_action :authenticate_user! # Add authentication if required

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:number_of_items)
  end
end
