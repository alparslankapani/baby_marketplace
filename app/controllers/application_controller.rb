class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) << :image
    devise_parameter_sanitizer.for(:account_update) << :image
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :bank_name
    devise_parameter_sanitizer.for(:account_update) << :bank_account
    devise_parameter_sanitizer.for(:account_update) << :bank_information_id
    devise_parameter_sanitizer.for(:account_update) << :adress_information_id

  end

  def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
	  { locale: I18n.locale }
  end

end
