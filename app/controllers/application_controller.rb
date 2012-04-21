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
    if ((request.path != login_callback_path) && (request.path != new_user_path) && (request.path != users_path))
      if (logged_in? && !User.find_by_email(user_email))
        flash[:notice] = "Sorry, we seem to be missing some information about you in our records, please fill in the form below before proceeding."
        redirect_to new_user_path
      end
    end
  end

  def logged_in?
    !(session[:user_email] == nil)
  end
end
