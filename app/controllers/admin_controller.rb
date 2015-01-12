class AdminController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin_user!
  def index
  end

	def settings
		@setting = WebsiteSetting.all.first
	end

	def save_settings
		@setting = WebsiteSetting.all.first
		if @setting.update_attributes(settings_params)
			flash[:notice] = "Settings Saved"
			redirect_to(:action=>'index')
		else
			render('settings')
		end
	end

	def mail_to_subscribers

	end

	def send_mail
		Subscriber.all.each do |s|
			SubscriberMailer.bulk_mail(s.email,params["subject"],params["message"]).deliver_later
		end
		render("mail_to_subscribers")
	end

private
	def settings_params
		params.require(:setting).permit(:title, :website_url, :email, :meta_keyword, :meta_description, :stripe_secret_key, :stripe_publishable_key, :upload_path)
	end

end
