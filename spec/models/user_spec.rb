require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
  
  describe 'get nearby families' do
     it 'should get all the nearby families' do
       @fake_families = [mock('Family'), mock('Family')]
       Family.should_receive(:find_all_by_locationID).with('1').and_return(@fake_families)
       User.findNearbyFamilies('1')
     end
  end
  
end
