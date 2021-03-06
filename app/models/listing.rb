class Listing < ActiveRecord::Base  
   if Rails.env.development?
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   else
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
    #:storage => :dropbox,
    #:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  	#:path => ":style/:id_:filename"
 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   end

   validates :name, :description, :price, presence: true
   validates :price, numericality: {greater_than: 0} 
   validates_attachment :image, :presence => true,
  :size => { :in => 0..2.megabytes }

  belongs_to :user
  accepts_nested_attributes_for :user
  has_many :orders
  has_many :pictures, dependent: :destroy
  belongs_to :category
  belongs_to :gender
  belongs_to :age_range

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
