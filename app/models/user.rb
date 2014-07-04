class User < ActiveRecord::Base
	if Rails.env.development?
	has_attached_file :image, :styles => { :medium => "60x", :thumb => "30x30>" }, :default_url => "default.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   else
	has_attached_file :image, :styles => { :medium => "60x", :thumb => "30x30>" }, :default_url => "default.jpg",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  	:path => ":style/:id_:filename"
 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   end

   validates_attachment :image, :presence => true,
   :size => { :in => 0..2.megabytes }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :name, presence: true 

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
end
