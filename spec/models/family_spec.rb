require 'spec_helper'

describe Family do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'get_size' do
     it 'should get the size of a particular family' do
       @fake_family_members = [mock('Family'), mock('Family')]
       FamilyMember.should_receive(:find_all_by_family_code).with('OAB123').should_receive(:count).and_return(1)
       Family.get_size('OAB123')
     end
  end
end
