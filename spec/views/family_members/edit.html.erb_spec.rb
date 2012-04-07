require 'spec_helper'

describe "family_members/edit" do
  before(:each) do
    @family_member = assign(:family_member, stub_model(FamilyMember))
  end

  it "renders the edit family_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => family_members_path(@family_member), :method => "post" do
    end
  end
end
