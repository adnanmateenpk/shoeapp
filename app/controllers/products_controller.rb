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
  end

  def delete
  end

private
  def product_params
    params.require(:product).permit(:mod_name,:sku,:position,:description,:status)
  end

end
