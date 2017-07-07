class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to user_products_path(current_user)
    else
      render :new
    end

  end

private
  def product_params
    params.require(:product).permit(:image,:product_name, :description, :details, :cost, :category, :artist_name, :region)
  end
end
