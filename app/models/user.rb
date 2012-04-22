class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :identity, :locationID
  has_many :families, :through => :donations
  has_many :donations
  def self.findNearbyFamilies(userLocationID)
    @families = Family.find_all_by_locationID(userLocationID)
    @families.delete_if { |family| family.approved_by == nil }
    return @families
  end
  
  def self.find_pending_families
    @families = Family.find(:all, :conditions => "approved_by IS NULL")
    return @families
  end
end
