class Family < ActiveRecord::Base
  has_many :family_members
  def self.get_sizes
    return ["2", "3", "4", "5", "6 or more"]
  end
end
