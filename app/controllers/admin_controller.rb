class AdminController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin_user!
  def index
  end

	def settings
	end

	def save_settings
	end

private
	def settings_params
		params.require(:setting).permit(:title, :website_url, :email, :meta_keyword, :meta_description, :stripe_secret_key, :stripe_publishable_key, :upload_path)
	end

end
