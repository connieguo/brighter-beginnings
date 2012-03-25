require 'spec_helper'

describe "families/index" do
  before(:each) do
    assign(:families, [
      stub_model(Family),
      stub_model(Family)
    ])
  end

  it "renders a list of families" do
    render
  end
end
