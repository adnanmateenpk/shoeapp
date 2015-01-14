module ApplicationHelper

	def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end

	def upload_files_custom(file)
		name = santize_filename(file["image"].original_filename)+Time.now.to_i
		directory = File.join("public",Setting.all.first.upload_path)
		path = File.join(directory,name)
		File.open(path,"wb"){|f| f.write(upload['image'].read) }
	end

	def sanitize_filename(file_name)
		# get only the filename, not the whole path (from IE)
		just_filename = File.basename(file_name)
		# replace all none alphanumeric, underscore or perioids
		# with underscore
		just_filename.sub(/[^\w\.\-]/,'-')
	end

end
