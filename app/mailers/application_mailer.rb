class ApplicationMailer < ActionMailer::Base
  #default from "website email"
  default from: WebsiteSetting.all.first.email
  layout 'mailer'
end
