class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end
  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
      flash[:success] = 'Product was successfully created.'
    else
      render 'new'
    end
  end


  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end
  # PATCH/PUT /products/1
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = 'Product was successfully updated.'
      redirect_to @product
    else
      render 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_url
  end

private

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price)
  end
end
