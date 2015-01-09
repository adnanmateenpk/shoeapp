class CreateWebsiteSettings < ActiveRecord::Migration
  def change
    create_table :website_settings do |t|
      t.string :title
      t.string :website_url
      t.string :email
      t.string :url
      t.string :meta_keyword
      t.string :meta_description
      t.string :stripe_secret_key
      t.string :stripe_publishable_key
      t.string :upload_path
      t.timestamps null: false
    end
  end
end
