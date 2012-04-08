module PagesHelper

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

end
