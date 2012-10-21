class Family < ActiveRecord::Base
  validates_uniqueness_of :family_code
  validates_presence_of :locationID, :family_code

  has_many :family_members, :dependent => :destroy, :foreign_key => 'family_code', :primary_key => 'family_code'
  has_many :users, :through => :donations
  
  OAKLAND_ID = 1
  RICHMOND_ID = 2
  ANTIOCH_ID = 3
  
  def get_size
	  return FamilyMember.find_all_by_family_code(self.family_code).count
  end
  
  def self.get_locations
    return [OAKLAND_ID, RICHMOND_ID, ANTIOCH_ID]
  end
  
  def self.get_location_name(id)
    case id
      when 0
        return "Admin"
      when 1
        return "Oakland"
      when 2
        return "Richmond"
      when 3
        return "Antioch"
    end
  end
end
