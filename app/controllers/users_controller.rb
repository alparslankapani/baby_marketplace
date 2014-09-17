class UsersController < ApplicationController
	  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
   @listings = @user.listings 
  end
end


private

def user_params
  params.require(:user).permit(:image, :listing_id, :bank_information_id, :user_id)
end