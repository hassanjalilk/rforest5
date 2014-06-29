class ProductsController < ApplicationController

  before_filter :ensure_logged_in, :only => [:create]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    if current_user
      @review = @product.review.build
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update_atrributes(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
