class ShopController < ApplicationController
  def index
    @products = Product.where(["status = ?",1])
  end

  def single
    @product = Product.where(["slug = ?",params[:slug]]).first
  end

  private

  def initialize_shopping_cart
    session["products"] = Array.new
  end

end
