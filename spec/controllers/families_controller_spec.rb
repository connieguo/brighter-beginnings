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
    {}
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
     @request.session[:redirect_path] = '/'
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
        response.should redirect_to(Family.last)
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
        response.should redirect_to(family)
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
      response.should redirect_to(families_url)
    end
  end
  
  describe "add family" do
    it "should add a new family" do
      @fake_family_params = {"family_code" => "1234", "locationID" => 1}
      @fake_family = mock_model(Movie)
      @fake_family_member_params = {"family_code" => "1234", "firstname" => "Jim"}
      @fake_family_member = mock_model(FamilyMember)
      Family.should_receive(:create!).with(@fake_family_params).and_return(@fake_family)
      FamilyMember.should_receive(:create!).with(@fake_family_member_params).and_return(@fake_family_member)
      post :add_family, {:family => @fake_family_params, @members => [@fake_family_member]}
      response.should redirect_to('show')
      flash[:notice].should == "Your family profile has been successfully created! It is now pending approval."
    end
    
    it "should fail to add a family" do
      @fake_family_params = {"family_code" => "1234"}
      @fake_family = mock_model(Movie)
      @fake_family_member_params = {"family_code" => "1234", "firstname" => "Jim"}
      @fake_family_member = mock_model(FamilyMember)
      Family.should_receive(:create!).with(@fake_family_params).should raise_error
      post :add_family, {:family => @fake_family_params, @members => [@fake_family_member]}
      response.should redirect_to('show')
      flash[:notice].should == "Sorry, one or more fields were not entered correctly. Please double-check that the information is correct."
    end
  end
  
  describe "view pending family blurbs" do
    it "assigns the list of family blurbs" do
      family_list = [mock_model(Family), mock_model(Family), mock_model(Family)]
      Family.should_receive(:get_pending).and_return(family_list)
      post :view_pending_families
      response.should render_template("show")
      assigns(:pending_families).should == admin_accounts
    end
  end
  
  describe "view family details" do
    it "assigns the list of family members" do
      family_id = "1234"
      family_members = [mock_model(FamilyMember), mock_model(FamilyMember)]
      FamilyMember.should_receive(:find_all_by_family_id).with(family_id).and_return(family_members)
      post :view_details, {:id => '1234'}
      response.should render_template("details")
      assigns(:members).should == family_members
    end
  end
  
  describe "pending" do
  end
  
  describe "approve" do
  end

end
