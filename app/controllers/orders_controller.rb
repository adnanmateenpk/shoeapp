class OrdersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin_user!
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end
end
