class ProductsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @user = current_user
  end

  def edit
    @product = Product.find(params[:id])
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to user_products_path(current_user)
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated successfully!"
      redirect_to  user_product_path(current_user,@product)
    else
      render :edit
    end
  end

private
  def product_params
    params.require(:product).permit(:image,:product_name, :description, :details, :cost, :category, :artist_name, :region)
  end
end
