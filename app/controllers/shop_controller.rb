class ShopController < ApplicationController
  layout 'shop'
  def index
    @products = Product.where(["status = ?",1])
  end

  def single
    @product = Product.where(["slug = ?",params[:slug]]).first
  end

  def add_to_cart
    if session["products"].nil?
      initialize_shopping_cart
    end
    product_count = session["products"].length
    session["products"][product_count] = Hash.new
    session["products"][product_count]["id"]=params[:selected]
    if params["quantity"+params[:selected]].nil? || params["quantity"+params[:selected]].blank?
      session["products"][product_count]["quantity"] = 1
    else
      session["products"][product_count]["quantity"] = params["quantity"+params[:selected]]
    end
    redirect_to(:action => "shopping_cart")
  end

  def shopping_cart
    @products = Array.new
    session["products"].each_with_index do |product, index|
    @products[index] = Hash.new
    @products[index]["product"] = ProductCharacteristic.find(product["id"])
    @products[index]["quantity"] = product["quantity"]
    end
  end

  private

  def initialize_shopping_cart
    session["products"] = Array.new
  end

end
