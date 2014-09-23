class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.welcome_message(@user).deliver unless @user.invalid?
  end

end