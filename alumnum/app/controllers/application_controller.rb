class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :type, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
       #binding.pry
  end

  protect_from_forgery with: :exception



end
