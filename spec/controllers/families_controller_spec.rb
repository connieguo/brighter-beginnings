require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FamiliesController do

  # This should return the minimal set of attributes required to create a valid
  # Family. As you add validations to Family, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    return {:profile => 'none', :display => true, :locationID => 1, :family_code => "123test"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FamiliesController. Be sure to keep this updated too.
  def valid_session
    return {:redirect_path => '/families/pending'}
  end

  describe "GET index" do
    it "assigns all families as @families" do
      family = Family.create! valid_attributes
      get :index, {}, valid_session
      assigns(:families).should eq([family])
    end
  end

  describe "GET show" do
    it "assigns the requested family as @family" do
      family = Family.create! valid_attributes
      get :show, {:id => family.to_param}, valid_session
      assigns(:family).should eq(family)
    end
  end

  describe "GET new" do
    it "assigns a new family as @family" do
      get :new, {}, valid_session
      assigns(:family).should be_a_new(Family)
    end
  end

  describe "GET edit" do
    it "assigns the requested family as @family" do
      family = Family.create! valid_attributes
      get :edit, {:id => family.to_param}, valid_session
      assigns(:family).should eq(family)
    end
  end

  describe "POST create" do
    before(:each) do
      session[:redirect_path] = '/families/pending'
    end
    describe "with valid params" do
      it "creates a new Family" do
        expect {
          post :create, {:family => valid_attributes}, valid_session
        }.to change(Family, :count).by(1)
      end

      it "assigns a newly created family as @family" do
        post :create, {:family => valid_attributes}, valid_session
        assigns(:family).should be_a(Family)
        assigns(:family).should be_persisted
      end

      it "redirects to the created family" do
        post :create, {:family => valid_attributes}, valid_session
        response.should redirect_to(session[:redirect_path])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved family as @family" do
        # Trigger the behavior that occurs when invalid params are submitted
        Family.any_instance.stub(:save).and_return(false)
        post :create, {:family => {}}, valid_session
        assigns(:family).should be_a_new(Family)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Family.any_instance.stub(:save).and_return(false)
        post :create, {:family => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested family" do
        family = Family.create! valid_attributes
        # Assuming there are no other families in the database, this
        # specifies that the Family created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Family.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => family.to_param, :family => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested family as @family" do
        family = Family.create! valid_attributes
        put :update, {:id => family.to_param, :family => valid_attributes}, valid_session
        assigns(:family).should eq(family)
      end

      it "redirects to the family" do
        family = Family.create! valid_attributes
        put :update, {:id => family.to_param, :family => valid_attributes}, valid_session
        response.should redirect_to(valid_session[:redirect_path])
      end
    end

    describe "with invalid params" do
      it "assigns the family as @family" do
        family = Family.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Family.any_instance.stub(:save).and_return(false)
        put :update, {:id => family.to_param, :family => {}}, valid_session
        assigns(:family).should eq(family)
      end

      it "re-renders the 'edit' template" do
        family = Family.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Family.any_instance.stub(:save).and_return(false)
        put :update, {:id => family.to_param, :family => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested family" do
      family = Family.create! valid_attributes
      expect {
        delete :destroy, {:id => family.to_param}, valid_session
      }.to change(Family, :count).by(-1)
    end

    it "redirects to the families list" do
      family = Family.create! valid_attributes
      delete :destroy, {:id => family.to_param}, valid_session
      response.should redirect_to(valid_session[:redirect_path])
    end
  end
  
  describe "pending" do
    before(:each) do
	    @family_a = Family.new(:locationID=>1, :family_code=>"123")
	    @family_b = Family.new(:locationID=>2, :family_code=>"345")
      @fake_families = [@family_a, @family_b]
    end
    it "should get the list of filtered non-approved families" do
      User.should_receive(:find_pending_families).and_return(@fake_families)
      @fake_families.should_receive(:keep_if).and_return(@family_a)
      post :pending, :location=>["Oakland"] 
   end
   it "should get the list of non-filtered non-approved families" do
      User.should_receive(:find_pending_families).and_return(@fake_families)
      post :pending
   end
  end
  
  describe "approve" do
    before(:each) do
       session[:redirect_path] = 
       @family = Family.new(:family_code=>"abc", :locationID=>1, :approved_by=>1)
       @user = User.new(:id=>1, :email=>"connie.guo@cs169.com")
    end
    it "should say Successfully approved if the family is approved" do
      Family.should_receive(:find).with("1").and_return(@family)
      valid_session[:user_email] = "connie.guo107@gmail.com"
      User.should_receive(:find_by_email).with(valid_session[:user_email]).and_return(@user)
      @family.approved_by.should == 1
      @family.should_receive(:save).and_return(true)
      post :approve, :id=>1
      response.should redirect_to "/families"
      flash[:notice].should == "Successfully approved abc."
    end
    it "should say Sorry something went wrong with the approval" do
      Family.should_receive(:find).with("1").and_return(@family)
      valid_session[:user_email] = "connie.guo107@gmail.com"
      User.should_receive(:find_by_email).with(valid_session[:user_email]).and_return(@user)
      @family.approved_by.should == 1
      @family.should_receive(:save).and_return(false)
      post :approve, :id=>1
      response.should redirect_to "/families"
      flash[:error].should == "Sorry, something went wrong with the approval. Please try again."
    end
  end

end
