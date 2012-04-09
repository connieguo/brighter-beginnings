require 'spec_helper'

describe SessionsController do

  before do
    OmniAuth.config.test_mode = true
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] = {
      "provider"=>"google",
      "uid"=>"http://xxxx.com/openid?id=118181138998978630963",
      "info"=>{"email"=>"markpeng@cs169.com", "first_name"=>"Mark", "last_name"=>"Peng", "name"=>"Mark Peng"}
  }
  end
  
  after do
    OmniAuth.config.test_mode = false
  end

  it 'should create a new session and direct to main user page' do
    mock_user = mock_model(User)
    User.should_receive(:find_by_email).with("markpeng@cs169.com").and_return(mock_user)
    post :create
    response.should redirect_to('/users/main')
    flash[:notice].should == "Login successful!  Welcome back, Mark Peng!"
    session[:user_email].should == "markpeng@cs169.com"
    session[:user_name].should == "Mark Peng"
    session[:user_firstname].should == "Mark"
    session[:user_lastname].should == "Peng"
  end
  
  it 'should create a new session and direct to new user signup' do
    User.should_receive(:find_by_email).with("markpeng@cs169.com").and_return(nil)
    post :create
    response.should redirect_to('/users/new')
    flash[:notice].should == "Login successful!  Since we have no information about you in our records, please fill in the form below before proceeding."
    session[:user_email].should == "markpeng@cs169.com"
    session[:user_name].should == "Mark Peng"
    session[:user_firstname].should == "Mark"
    session[:user_lastname].should == "Peng"
  end
  
  it 'should handle a failed authentication' do
    post :failed_login
    response.should redirect_to('/')
    flash[:error].should == "There was a problem with logging in, please click the Sign In button and try again."
  end
  
  it 'should log the user out' do
    post :logout
    response.should redirect_to('/')
    flash[:notice].should == "Successfully logged out."
    session[:user_email].should == nil
    session[:user_name].should == nil
    session[:user_firstname].should == nil
    session[:user_lastname].should == nil
  end

end
