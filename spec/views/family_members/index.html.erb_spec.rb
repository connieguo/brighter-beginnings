require 'spec_helper'

describe "family_members/index" do
  before(:each) do
    assign(:family_members, [
      stub_model(FamilyMember),
      stub_model(FamilyMember)
    ])
  end

  it "renders a list of family_members" do
    render
  end
end
