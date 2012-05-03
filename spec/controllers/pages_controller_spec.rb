require 'spec_helper'

describe PagesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', {}, {:test => true}
      response.should be_success
    end
  end

end
