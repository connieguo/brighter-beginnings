class Donation < ActiveRecord::Base
  validates_presence_of :user_id, :family_code

  belongs_to :user
  belongs_to :family
  def get_donor
    return User.find_by_id(self.user_id)
  end
  def get_location
	  if self.dropoff_site == 1
  		return "Oakland"
  	elsif self.dropoff_site == 2
  		return "Richmond"
  	elsif self.dropoff_site == 3
  		return "Antioch"
  	elsif self.dropoff_site == 4
  		return "Bay Point"
  	else
  		return ""
  	end
  end
end
