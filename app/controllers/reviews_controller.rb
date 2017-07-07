class ReviewsController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Review added successfully!"
      redirect_to user_product_path(current_user,@product)
    else
      flash[:alert] = "Error while adding review. Please add review again!"
      redirect_to user_product_path(current_user,@product)
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.delete
    flash[:notice] = "Review deleted successfully!"
    redirect_to user_product_path(current_user,@product)
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully!"
      redirect_to user_product_path(current_user,@product)
    else
      render :edit
    end
  end

private
  def review_params
    params.require(:review).permit(:comment,:rating)
  end
end
