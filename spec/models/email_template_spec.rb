require 'spec_helper'

describe EmailTemplate do
  describe "get current template" do
    it "should return the newest email template" do
      @template = mock('EmailTemplate')
      EmailTemplate.should_receive(:find).and_return(@template)
      EmailTemplate.get_current_template.should == @template
    end
  end
end
