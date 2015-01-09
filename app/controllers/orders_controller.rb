class OrdersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin_user!  
  def index
  end

  def edit
  end
end
