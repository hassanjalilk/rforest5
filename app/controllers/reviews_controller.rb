class ReviewsController < ApplicationController

	before_filter = :ensure_logged_in, :only => [:create, :edit, :show, :update, :destroy]

  def show
  	@product = Product.find[params[:id]]

  end

  def create
  	@product = Product.find(params[:product_id])
  	@review = @product.review.build(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  		redirect_to products_path, :notice => "Review Created!"
  	else
  		render "new"
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private

  def review_params
  	params.require(:review).permit(:product_id, :create, :comment)
	end

	def load_product
		@product = Product.find(:product_id)
end
