class CharacteristicsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin_user!
  def index
    @product_slug = params[:product_slug]

  end

  def show
    @product_slug = params[:product_slug]
  end

  def new
    @product_characterics = ProductCharacteristic.new
    @product_slug = params[:product_slug]
  end

  def edit
    @product_slug = params[:product_slug]
  end

  def delete
    @product_slug = params[:product_slug]
  end
end
