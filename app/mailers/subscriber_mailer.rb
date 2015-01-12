class SubscriberMailer < ApplicationMailer
  def bulk_mail(email,subject,message)
    @message = message
    mail(to: email, subject: subject)
  end
end
