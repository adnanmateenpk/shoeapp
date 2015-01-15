class ChargesController < ApplicationController
  Stripe.api_key = WebsiteSetting.all.first.stripe_secret_key
  layout 'shop'
  def details

  end

  def charge
      @amount = session[:total_price]*100

      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount.to_i,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
      )

      order = Order.new
      order.tracking_no = Time.now.to_i.to_s
      if user_signed_in?
        order.user_id = current_user_id
      else
        order.user_id = 0
      end

      order.total_price = session[:total_price]
      order.status = 0
      order.save
      session["products"].each_with_index do |product, index|
      char_order = CharsOrder.new
      char_order.order_id = order.id
      char_order.chars_id = product["id"]
      char_order.quantity = product["quantity"]
      char_order.save
    end

    reset_session
    flash[:notice] = "Payment Made you reciept number/tracking number is "+customer.id.to_s
    redirect_to(:action => "index", :controller => "shop")
    

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to({:action=>"details"})
  end

end
