require 'spec_helper'

describe EmailTemplate do

  describe "edit_template" do
    before do
      @template = "test email template"
    end
    it "should change the email template" do
      EmailTemplate.edit_template(@template)
      EmailTemplate.get_current_template.should == @template
    end
  end
  
  describe "get_current_template" do
    before do
      @template = "test email template, {{user_name}}."
      EmailTemplate.edit_template(@template)
      session[:user_name] = "test user"
    end
    it "should return the email template with fields filled in" do
      EmailTemplate.get_current_template.should == "test email template, test user."
    end
  end
end
