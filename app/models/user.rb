class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :identity, :locationID
  has_many :families, :through => :donations
  has_many :donations
  def self.findNearbyFamilies(userLocationID)
    if (userLocationID == 0)
      @families = Family.find(:all)
    else
      @families = Family.find_all_by_locationID(userLocationID)
    end
    @families.delete_if { |family| family.approved_by == nil }
    return @families
  end
  
  def self.find_pending_families
    @families = Family.find(:all, :conditions => "approved_by IS NULL")
    return @families
  end
  
  def get_location
	  if self.locationID == 1
		  return "Oakland"
	  elsif self.locationID == 2
		  return "Richmond"
	  elsif self.locationID == 3
	  	return "Antioch"
	  elsif self.locationID == 4
		  return "Bay Point"
	  else
		  return ""
	  end
  end
  
end
