class Picture < ActiveRecord::Base

belongs_to :listing
if Rails.env.development?
	has_attached_file :image, :styles => { :medium => "15x", :thumb => "10x10>" }, :default_url => "default.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   else
	has_attached_file :image, :styles => { :medium => "15x", :thumb => "10x10>" }, :default_url => "default.jpg",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  	:path => ":style/:id_:filename"
 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   end

end
