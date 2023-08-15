class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def basket
    @cart = current_user.cart || Cart.create(user_id: current_user.id)

    if params[:product_id]
      product = Product.find(params[:product_id])
      CartItem.create!(cart_id: @cart.id, quantity: 1, product_id: product.id)
    end

    @cart_items = @cart.cart_items.where("quantity > 0")
  end

  def remove_from_cart
    @cart = current_user.cart
    @cart_item = @cart.cart_items.find_by(id: params[:cart_item_id])

    if @cart_item
      @cart_item.destroy
    end

    redirect_to basket_path
  end
end
