class CharacteristicsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin_user!
  def index
    @product_slug = params[:product_slug]
    @product_characteristics = ProductCharacteristic.all
  end

  def show
    @product_slug = params[:product_slug]
  end

  def create
    @product_slug = params[:product_slug]
    @product_characterics = ProductCharacteristic.new(characteristic_params)
    @product_characterics.product_id = Product.where(["slug = ?",@product_slug]).first.id;
    if @characteristic.save
      flash[:notice]="Characteristic created successfully"
      redirect_to(product_characteristics_path(@product_slug))
    else
      render('new')
    end
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
  
  private
  def characteristic_params
    if params[:product_characteristic][:slug].blank?
       params[:product_characteristic][:slug] = (params[:product_slug]+" "+params[:product_characteristic][:color]+" "+params[:product_characteristic][:size]).parameterize
    else
        params[:product_characteristic][:slug] = params[:product_characteristic][:slug].parameterize
    end
    params.require(:product_characteristic).permit(:price,:color,:size,:image,:slug)
  end

end
