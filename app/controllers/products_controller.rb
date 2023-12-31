class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_product, only: %i[ show edit update destroy ]

  def search_results
    search_query = params[:search_query]
    puts "Search Query: #{search_query}" # Check the value in the console
    @search_results = Product.where("name ILIKE ?", "%#{search_query}%")
  end


  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.

    def set_product
      if params[:id] == 'basket'
        # Handle the case where the user is trying to access a "basket" page
        # You can either redirect, render a different view, or handle it as needed
        # Example:
        redirect_to basket_path
      else
        @product = Product.find(params[:id])
      end
    end


    # Only allow a list of trusted parameters through.

  def product_params
    params.require(:product).permit(:name, :rating, :description, :short_description, :price, :user_id, :admin, photos:[])
  end
end
