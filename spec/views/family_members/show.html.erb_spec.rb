require 'spec_helper'

describe "family_members/show" do
  before(:each) do
    @family_member = assign(:family_member, stub_model(FamilyMember))
  end

  it "renders attributes in <p>" do
    render
  end
end
