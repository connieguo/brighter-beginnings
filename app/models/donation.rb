class Donation < ActiveRecord::Base
  validates_presence_of :user_id, :family_code

  belongs_to :user
  belongs_to :family
  def get_donor
    return User.find_by_id(self.user_id)
  end
  def get_location
  	Family.get_location_name(self.dropoff_site)
  end
end
