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
  
  def user_at_least_case_manager?
    @user = User.find_by_email(session[:user_email])
    if @user
      @user.identity >= 2
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
  
  def user_at_least_manager?
    @user = User.find_by_email(session[:user_email])
    if @user
      @user.identity >= 3
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
  
  def logged_in?
    session[:user_email] != nil
  end
  
  def is_link_active? (path)
    if request.path == path
      return "active"
    else
      return "inactive"
    end
  end
  
  def navbar_link(label, path)
    html = "<li"
    if request.path == path
      html += " class=\"active\">"
    else
      html += ">"
    end
    html += "<a href = \"#{path}\">#{label}</a></li>"
    return html.html_safe
  end
  
  def get_family_id_from_code(family_code)
    Family.find_by_family_code(family_code).id
  end
end
