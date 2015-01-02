class ProductsController < ApplicationController
layout 'admin'
# before_action :authenticate_admin_user!


  def index
  @products = Product.all
  #@products = Product.sorted ##gave me an error.
  end

  def show

  end

  def new
    @product = Product.new
  end

  def edit
  end

  def delete
  end

end
