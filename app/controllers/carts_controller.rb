class CartsController < ApplicationController
  before_action :set_cart, only:[:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @art = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart
    else
      render 'new'
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to @cart
    else
      render 'edit'
    end
  end

  def destroy
    @cart.destroy
    redirect_to carts_url
  end

private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params[:carts]
  end
end
