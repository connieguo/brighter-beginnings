require 'spec_helper'

describe Family do
  describe 'get_size' do
     it 'should get the size of a particular family' do
       @fake_members = [mock('FamilyMember')]
       @family = Family.new(:family_code => 'OAB123', :locationID => 2)
       FamilyMember.should_receive(:find_all_by_family_code).with('OAB123').and_return(@fake_members)
       @fake_members.should_receive(:count).and_return(1)
       @family.get_size.should == 1
     end
  end
  
  describe 'get_locations' do
    it 'should return an array with the locations' do
      Family.get_locations.should == [1,2,3,4]
    end
  end
  
  describe 'get_location_name' do
    it 'should return oakland for 1' do
      Family.get_location_name(1).should == "Oakland"
    end
    it 'should return oakland for 2' do
      Family.get_location_name(2).should == "Richmond"
    end
    it 'should return oakland for 3' do
      Family.get_location_name(3).should == "Antioch"
    end
    it 'should return oakland for 4' do
      Family.get_location_name(4).should == "Bay Point"
    end
  end
end
