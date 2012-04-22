module FamiliesHelper

  def location_checked?(id)
    puts params[:location]
    if params[:location]
      if params[:location].include?(Family.get_location_name(id))
        true
      else
        false
      end
    else
      true
    end
  end

end
