require 'spec_helper'

describe "families/show" do
  before(:each) do
    @family = assign(:family, stub_model(Family))
  end

  it "renders attributes in <p>" do
    render
  end
end
