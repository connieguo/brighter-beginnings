class FamilyMember < ActiveRecord::Base
  validates_presence_of :family_code, :firstname

  belongs_to :family
end
