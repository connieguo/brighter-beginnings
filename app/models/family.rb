class Family < ActiveRecord::Base
  validates_uniqueness_of :family_code
  validates_presence_of :locationID

  has_many :family_members
  has_many :users, :through => :donations
  def get_size
	return FamilyMember.find_all_by_family_code(self.family_code).count
  end
end
