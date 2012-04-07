require 'spec_helper'

describe "family_members/new" do
  before(:each) do
    assign(:family_member, stub_model(FamilyMember).as_new_record)
  end

  it "renders new family_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => family_members_path, :method => "post" do
    end
  end
end
