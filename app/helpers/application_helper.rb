module ApplicationHelper

	def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end

	def upload_files_custom
		Dir.pwd
	end
end
