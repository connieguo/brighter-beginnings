class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_login
  
  def user_email
    session[:user_email]
  end
  
  def user_firstname
    session[:user_firstname]
  end
  
  def user_lastname
    session[:user_lastname]
  end
  
  def user_name
    session [:user_name]
  end
  
  def check_login
    if ((request.path != login_callback_path) && (request.path != new_user_path) && (request.path != '/users'))
      if (logged_in? && !User.find_by_email(user_email))
        flash[:notice] = "Sorry, we seem to be missing some information about you in our records, please fill in the form below before proceeding."
        redirect_to new_user_path
      end
    end
  end

  def logged_in?
    !(session[:user_email] == nil)
  end
  
  def fill_template (template)
    return nil if template == nil
    user = User.find_by_email(session[:user_email])
    result = template
    result = result.gsub("{{user_name}}", session[:user_name])
    result = result.gsub("{{user_email}}", session[:user_email])
    result = result.gsub("{{user_firstname}}", session[:user_firstname])
    result = result.gsub("{{user_lastname}}", session[:user_lastname])
    result = result.gsub("{{user_location}}", Family.get_location_name(user.locationID))
    #result = result.gsub("{{family_code}}", TODO: fill in family code logic)
  end
end
