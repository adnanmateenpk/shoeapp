class ChargesController < ApplicationController
  Stripe.api_key = WebsiteSetting.all.first.stripe_secret_key
  layout 'shop'
  def details

  end

  def charge
  end

end
