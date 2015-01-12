class AdminController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin_user!
  def index
  end

	def settings
		@settings = WebsiteSetting.all.first
	end

	def save_settings
		@settings = Website.all.first
		if @settings.update_attributes(settings_params)
			redirect_to("index")
		else
			render('settings')
		end
	end

private
	def settings_params
		params.require(:setting).permit(:title, :website_url, :email, :meta_keyword, :meta_description, :stripe_secret_key, :stripe_publishable_key, :upload_path)
	end

end
