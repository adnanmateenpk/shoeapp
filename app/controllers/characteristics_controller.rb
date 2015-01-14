class CharacteristicsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin_user!
  def index
    @product_slug = params[:product_slug]
    @product_characteristics = ProductCharacteristic.all
  end

  def show
    @product_characteristics = ProductCharacteristic.where(["slug = ?",params[:slug]]).first
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
    @product_characteristic = ProductCharacteristic.where(["slug = ?",params[:slug]]).first
    @product_slug = params[:product_slug]
  end

  def delete
    @product_slug = params[:product_slug]
    @product_characteristic = ProductCharacteristic.where(["slug = ?",params[:slug]]).first
  end

  def destroy
    @product = ProductCharacteristic.where(["slug = ?",params[:slug]]).first.destroy
    flash[:notice]="Characteristic destroyed successfully"
    redirect_to(:action=>'index')
  end

  def update
    @product_characteristic = ProductCharacteristic.where(["slug = ?",params[:slug]]).first

    if @product_characteristic.update_attributes(characteristic_params)
      flash[:notice]="Characteristic Update Successfully"
      redirect_to(:action=>'index')
    else
      @product_characteristic_count = ProductCharacterisitc.count
      render('edit')
    end
  end

  private
  def characteristic_params
    params[:product_characteristics][:image]= upload_files_custom(params[:product_characteristic][:image])
    if params[:product_characteristic][:slug].blank?
       params[:product_characteristic][:slug] = (params[:product_slug]+" "+params[:product_characteristic][:color]+" "+params[:product_characteristic][:size]).parameterize
    else
        params[:product_characteristic][:slug] = params[:product_characteristic][:slug].parameterize
    end
    params.require(:product_characteristic).permit(:price,:color,:size,:image,:slug)
  end

end
