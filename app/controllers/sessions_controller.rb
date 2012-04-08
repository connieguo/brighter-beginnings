class SessionsController < ApplicationController

  def create
    @hash = auth_hash
    user_email = @hash["info"]["email"]
    #@user = User.find_by_email(user_email)
    session[:user_email] = user_email
    session[:user_firstname] = @hash["info"]["first_name"]
    session[:user_lastname] = @hash["info"]["last_name"]
    session[:user_name] = @hash["info"]["name"]
    flash[:notice] = "Login successful!  Welcome back, #{session[:user_name]}"
    redirect_to '/'
  end
  
  def failed_login
    flash[:error] = "There was a problem with logging in, please click the Sign In button and try again"
    redirect_to '/'
  end
  
  def logout
    @hash = nil
    @user = nil
    reset_session
    flash[:notice] = "Successfully logged out."
    redirect_to '/'
  end
  
  protected
  
  def auth_hash
    request.env['omniauth.auth']
  end

end
