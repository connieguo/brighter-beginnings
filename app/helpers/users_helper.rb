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

  def get_family_id_from_code(family_code)
    Family.find_by_family_code(family_code).id
  end

  def get_status_id(donation_id)
    donation = Donation.find_by_id(donation_id)
    @status = "#{donation.family_code}-Pending" if donation.approved_by == nil
    @status = "#{donation.family_code}-Approved" if donation.approved_by != nil
    @status = "#{donation.family_code}-Dropped-Off" if donation.dropped_off_date != nil
    return @status
  end

  def get_donation_status(donation_id)
    html = ""
    donation = Donation.find_by_id(donation_id)
    html = "<font color='#C68E17'>Waiting for approval.</font>" if donation.approved_by == nil
    html = "<font color='#347C17'>Approved!  Waiting for dropoff.</font>" if donation.approved_by != nil
    html = "<font color='#3B9C9C'>Dropped off on #{donation.dropped_off_date}!  Thank you!</font>" if donation.dropped_off_date != nil
    html.html_safe
  end
  
  def get_user_info(id)
    user = User.find(id)
    return "#{user.firstname} #{user.lastname} (#{user.email})"
  end
end
