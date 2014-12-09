class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) << :first_name
  		devise_parameter_sanitizer.for(:sign_up) << :last_name
  		devise_parameter_sanitizer.for(:sign_up) << :nickname
  		devise_parameter_sanitizer.for(:sign_up) << :location
		#devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstname, :middlename, :lastname, :nickname) }
	end
end
