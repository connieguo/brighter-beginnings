require 'spec_helper'

describe Donation do
  before do
    @donation = Donation.new(:id=>1, :user_id=>1, :dropoff_site=>1)
  end
  describe 'get_donor' do
    it "should find the donor for this donation" do
      @fake_user = mock('User')
      User.should_receive(:find_by_id).with(@donation.user_id).and_return(@fake_user)
      @donation.get_donor.should == @fake_user
    end
  end  

  describe 'get_location' do
    it "should get the location of the family" do
      Family.should_receive(:get_location_name).with(@donation.dropoff_site).and_return("Oakland")
      @donation.get_location
    end
  end
end

