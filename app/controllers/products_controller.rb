class ProductsController < ApplicationController
layout 'admin'
before_action :authenticate_admin_user!

  def index
  @products = Product.sorted
  end

  def show
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    flash[:notice]="Product '#{@product.mod_name}' destroyed successfully"
    redirect_to(:action=>'index')
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:notice]=@product.status
      redirect_to(:action=>'index')
    else
      @product_count = Product.count
      render('edit')
    end
  end

private
  def product_params
    if params[:product][:slug].blank?
       params[:product][:slug] = params[:product][:mod_name].parameterize
    else
        params[:product][:slug] = params[:product][:slug].parameterize
    end
    params.require(:product).permit(:mod_name,:sku,:position,:description,:status,:slug)
  end

end
