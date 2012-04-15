require 'spec_helper'

describe Family do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'get_size' do
     it 'should get the size of a particular family' do
       FamilyMember.should_receive(:find_all_by_family_code).with('OAB123').should_receive(:count).and_return(1)
       Family.get_size('OAB123')
     end
  end
  describe 'get_pending' do
     it 'should get all families whose blurbs have not been approved yet' do
       @fake_pending_families = [mock('Family'), mock('Family')]
       Family.should_receive(:find_all_by_approved).with("true").and_return(@fake_pending_families)
       Family.get_pending()
     end
  end
end
