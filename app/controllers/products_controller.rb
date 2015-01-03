class ProductsController < ApplicationController
layout 'admin'
# before_action :authenticate_admin_user!

  def index
  @products = Product.sorted
  end

  def show

  end

  def new
    @product = Product.new
    @product_count = Product.count + 1
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice]="Product created successfully"
        redirect_to(:action=>'index')
      else
        @product_count = Product.count + 1
        render('new')
  end
  end

  def edit
    @product = Product.find(params[:id])
    @product_count = Product.count
  end

  def delete
  end

  def update
    @product = Product.find(params[:id])
    if @product.save
      flash[:notice]="Product update successfully"
      redirect_to(:action=>'index')
    else
      @product_count = Product.count
      render('edit')
    end
  end

private
  def product_params
    params.require(:product).permit(:mod_name,:sku,:position,:description,:status)
  end

end
