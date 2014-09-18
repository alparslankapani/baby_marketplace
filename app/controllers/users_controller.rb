class UsersController < ApplicationController
	  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @listings = @user.listings 
    @reviews = Review.where(user_id: @user.id).order("id DESC")
    if @reviews.blank?
    	@avg_rating = 0 
    else
    	@avg_rating = @reviews.average(:rating).round(2)
	end
  end
end


private

def user_params
  params.require(:user).permit(:image, :listing_id, :bank_information_id, :user_id)
end