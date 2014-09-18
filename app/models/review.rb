class Review < ActiveRecord::Base
	belongs_to :user

	validates :rating, :comment, presence: true
	validates :rating, numericality: {
		only_integer: true,
		greater_then_or_equal_to: 1,
		less_than_or_equal_to: 5,
		message: "Değerlendirme sadece 1 ile 5 arasında ve tam sayı olarak yapılır."
	}

end
