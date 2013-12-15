class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      redirect_to @line_item
    else
      render 'new'
    end
  end

  def update
    set_line_item
    if @line_item.update(line_items_params)
      redirect_to @line_item
    else
      render 'edit'
    end
  end

  def destroy
    set_line_item.destroy
    redirect_to line_items_url
  end

private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_items_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end
end
