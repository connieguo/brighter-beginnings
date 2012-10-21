class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :identity, :locationID, :email
  has_many :families, :through => :donations
  has_many :donations, :dependent => :destroy
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
	  Family.get_location_name(self.locationID)
  end
 
  def notify_registration
     if (self.identity == 1)
        UserMailer.registration_confirmation(self).deliver
     end
  end 

  def notify_donation_approved(donation)
     UserMailer.donation_confirmation(self,donation).deliver
  end

  def notify_donation_rejected
     UserMailer.donation_rejection(self).deliver
  end

  def notify_status_changed
     UserMailer.status_confirmation(self).deliver
  end
end
