class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :identity, :locationID
  has_many :families, :through => :donations
  has_many :donations
  def self.findNearbyFamilies(userLocationID)
    @families = Family.find_all_by_locationID(userLocationID)
    return @families
  end
end
