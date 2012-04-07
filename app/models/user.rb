class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :identity, :locationID
  has_many :families, :through => :donations
  has_many :donations
end
