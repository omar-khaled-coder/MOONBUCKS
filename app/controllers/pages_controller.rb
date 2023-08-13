class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def basket
    puts "Params: #{params.inspect}" # Debug output
    @cart = current_user.cart || Cart.create(user_id: current_user.id)

    cart_items = []
    params.each do |key, value|
      puts "Processing key: #{key}, value: #{value}" # Debug output
      @product = Product.find(params[:product_id])
      puts "Found product: #{@product.name}" # Debug output
      cart_items << CartItem.create!(cart_id: @cart.id, quantity: value.to_i, product_id: @product.id)

    end
    @cart.save
    @cart_items = cart_items.reject { |cart_item| cart_item.quantity == 0 }
  end






end
