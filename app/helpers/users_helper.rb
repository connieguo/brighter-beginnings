module UsersHelper
  def checked(size) 
    if params[:family_size] && params[:family_size].include?(size.to_s)
      return "checked=yes"
    else
      return ""
    end
  end
  
  def appropriate_promotions
    result = ['Donor', 'Case Manager']
    if User.find_by_email(session[:user_email]).identity == 4
      result << 'Manager'
    end
    return result
  end
end
