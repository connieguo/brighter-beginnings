module ApplicationHelper

  def session_status_link
    if session[:user_name] == nil
      link_to "Sign In", "/auth/google"
    else
      link_to "(Logout)", "/logout"
    end
  end
  
  def session_username_link
    link_to "#{session[:user_name]}", "/profile"
  end
  
  def user_is_case_manager?
    @user = User.find_by_email(session[:user_email])
    if @user
      @user.identity == 2
    else
      false
    end
  end
  
  def user_is_manager?
    @user = User.find_by_email(session[:user_email])
    if @user
      @user.identity == 3
    else
      false
    end
  end
  
  def user_is_superuser?
    @user = User.find_by_email(session[:user_email])
    if @user
      @user.identity == 4
    else
      false
    end
  end

end
