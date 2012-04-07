class Donation < ActiveRecord::Base
  validates_presence_of :user_id, :family_code

  belongs_to :user
  belongs_to :family
end
