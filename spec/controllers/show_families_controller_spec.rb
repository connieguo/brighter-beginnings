require 'spec_helper'

describe ShowFamiliesController do

  describe 'show families from Antioch' do 
    it 'creates a donor user from city "Antioch"' do 
      valid_attributes += {:location => 'Antioch'}
      expect { post :create, {:user => valid_attributes}, valid_session }.to change(User, :count).by(1)
      post :create, {:user => valid_attributes}, valid_session
      assigns(:user).should be_a(User)
      assigns(:user).should be_persisted
    end
    it 'shows all familes from city donor is from ("Antioch")' do 
      flash[:notice].should == "These are the Antioch families"
    end
  end
  
  describe 'show familes from Fake (a non-existant city or city without any families)' do 
    it 'creates a donor from city "Fake"' do 
      valid_attributes += {:location => 'Fake'}
      expect { post :create, {:user => valid_attributes}, valid_session }.to change(User, :count).by(1)
      post :create, {:user => valid_attributes}, valid_session
      assigns(:user).should be_a(User)
      assigns(:user).should be_persisted
    end
    it 'shows all familes from city donor is from ("Fake", there should be none)' do 
      flash[:notice].should == "There are no families in this area."
    end
  end
end
