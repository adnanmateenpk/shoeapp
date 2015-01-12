class SubscriberMailer < ApplicationMailer
  def bulk_mail(email,subject,message)
    @message = message
  end
end
