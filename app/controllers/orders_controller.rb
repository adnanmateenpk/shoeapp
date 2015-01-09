class OrdersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin_user!
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    if @order.save
      flash[:notice]="Status changed for order #{@order.tracking_no}"
      redirect_to(:action=>"index")
    else
      render('edit')
    end
  end

end
