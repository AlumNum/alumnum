class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :configure_permitted_parameters, if: :devise_controller?

#Todo figure out how to link to a user's own profile all proper-like
  helper_method :current_alum_profile_id


  def current_alum_profile_id
  	if (Profile.find_by :user_id => current_user.id)
      (Profile.find_by :user_id => current_user.id).id
    else
      false
    end
  end

  helper_method :is_alum?

  def is_alum?
    current_user.type =='Alum'
  end

  protected
  
  def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :type, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
       #binding.pry
  end

  protect_from_forgery with: :exception



end
