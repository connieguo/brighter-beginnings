class Family < ActiveRecord::Base
  validates_uniqueness_of :family_code
  validates_presence_of :locationID

  has_many :family_members
  has_many :users, :through => :donations
  
  OAKLAND_ID = 1
  RICHMOND_ID = 2
  ANTIOCH_ID = 3
  BAY_POINT_ID = 4
  
  def get_size
	  return FamilyMember.find_all_by_family_code(self.family_code).count
  end
  
  def self.get_locations
    return [OAKLAND_ID, RICHMOND_ID, ANTIOCH_ID, BAY_POINT_ID]
  end
  
  def self.get_location_name(id)
    case id
      when 1
        return "Oakland"
      when 2
        return "Richmond"
      when 3
        return "Antioch"
      when 4
        return "Bay Point"
    end
  end
end
