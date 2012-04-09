class Family < ActiveRecord::Base
  validates_uniqueness_of :family_code
  validates_presence_of :locationID

  has_many :family_members
  has_many :users, :through => :donations
end
