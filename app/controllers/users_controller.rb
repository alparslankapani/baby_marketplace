class UsersController < ApplicationController
	  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @listings = Listing.where(listing_id: current_user.listing_id)
  end
end


private

def user_params
  params.require(:user).permit(:image, :listing_id, :bank_information_id, :bank_name, :bank_account)
end