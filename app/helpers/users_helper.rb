module UsersHelper
  def checked(size) 
    if params[:family_size] && params[:family_size].include?(size.to_s)
      return "checked=yes"
    else
      return ""
    end
  end  
end
