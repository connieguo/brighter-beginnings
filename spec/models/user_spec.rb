require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
=begin 
  describe 'findNearbyFamilies' do
     it 'should get all the nearby families' do
       @fake_families = [mock('Family'), mock('Family')]
       Family.should_receive(:find_all_by_locationID).with('1').and_return(@fake_families)
       User.findNearbyFamilies('1')
     end
  end
  describe 'get_all_admins' do
     it 'should get all the admin accounts' do
       @fake_admins = [mock('User'), mock('User')]
       User.should_receive(:find_all).with(:conditions => ["identity > 1"]).and_return(@fake_admins)
       User.get_all_admins()
     end
  end
  
   describe "get_all_donors" do
      it 'should get all the donor accounts' do
        @fake_donors = [mock('User'), mock('User')]
        User.should_receive(:find_all_by_identity('1')).and_return(@fake_donors)
        User.get_all_donors()
      end
   end
=end
end
