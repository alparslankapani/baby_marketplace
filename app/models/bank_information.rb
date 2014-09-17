class BankInformation < ActiveRecord::Base
	belongs_to :user
	#belongs_to :seller, class_name: "User"
end
