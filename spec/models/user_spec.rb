require 'spec_helper'

describe User do

  describe 'find_nearby_families' do

    before do
      @family_a = Family.new(:family_code => '1234', :locationID => 1, :approved_by => '123test')
      @family_b = Family.new(:family_code => '1234', :locationID => 1)
    end

    it 'should get all families for location 0' do
      @fake_families = [@family_a, @family_b]
      @fake_trimmed_families = [@family_a]
      Family.should_receive(:find).with(:all).and_return(@fake_families)
      User.findNearbyFamilies(0).should == @fake_trimmed_families
    end
    
    it 'should get all families that match the location id' do
      @fake_families = [@family_a, @family_b]
      @fake_trimmed_families = [@family_a]
      Family.should_receive(:find_all_by_locationID).with(2).and_return(@fake_families)
      User.findNearbyFamilies(2).should == @fake_trimmed_families
    end

  end
  
  describe 'get_pending_families' do
     it 'should get all families whose blurbs have not been approved yet' do
       @fake_pending_families = [mock('Family'), mock('Family')]
       Family.should_receive(:find).with(:all, :conditions => "approved_by IS NULL").and_return(@fake_pending_families)
       User.find_pending_families.should == @fake_pending_families
     end
  end
  
  describe 'get_location' do
    it 'should return the location of this user' do
      @user = User.new(:email => 'mahkuh@cs169.com', :identity => '1', :locationID => 1)
      Family.should_receive(:get_location_name).and_return("Oakland")
      @user.get_location.should == "Oakland"
    end
  end
end
