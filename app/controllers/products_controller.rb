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
    @product_count = @products.count + 1
  end

  def edit
  end

  def delete
  end

end
