class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
  
    @users = User.all
    @donors = User.find_all_by_identity(1)
    @case_managers = User.find_all_by_identity(2)
    @managers = User.find_all_by_identity(3)
     

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
    
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_email(session[:user_email])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by_email(session[:user_email])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.identity = 1
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_main_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  def main
    session[:redirect_path] = user_main_path
    @user_email = session[:user_email]
    @user = User.find_by_email(@user_email)
    @families = User.findNearbyFamilies(@user.locationID)
    @display_families = []
    @family_sizes = [1,2,3,4,5]
    if params[:family_size] 
    	@families.each do |family|
          params[:family_size].each do |size|
            #get all families size 5 or greater
            if size == 5 && FamilyMember.find_all_by_family_code(family.family_code).count >= size
		          @display_families << family
      		  elsif FamilyMember.find_all_by_family_code(family.family_code).count.to_s == size
        	  	@display_families << family
      		  end
          end
    	end
    else
       @display_families = @families
    end    
    
    respond_to do |format|
       format.html
    end
  end
  
  def manage
    @user = User.find_by_email(session[:user_email])
    @user_to_promote = User.find_by_email(params[:user_promotion][:user_email])
    if @user_to_promote == nil
      flash[:error] = "This user was not found.  Please double check to make sure this user exists."
    else
      if @user_to_promote.identity >= @user.identity
        flash[:error] = "You require additional permissions to change this user's account level."
      else
        case params[:user_promotion][:account_level]
          when 'Donor'
            @user_to_promote.identity = 1
            if @user_to_promote.identity == 3
              @user_to_promote.locationID = 1
            end
          when 'Case Manager'
            @user_to_promote.identity = 2
          when 'Manager'
            @user_to_promote.identity = 3
            @user_to_promote.locationID = 0
        end
        
        if @user_to_promote.save!
          @user_to_promote.notify_status_changed
          flash[:notice] = "Successfully changed user."
        else
          flash[:error] = "An error occurred, please try again"
        end
      end
    end
    respond_to do |format|
      format.html {redirect_to users_url}
      format.json { head :ok }
    end
  end
  
  def view_donations
    @user = User.find_by_email(session[:user_email])
    if @user.identity >= 2
      @donations = Donation.find(:all, :conditions => ['approved_by IS NOT NULL'])
    else
      @donations = Donation.find_all_by_user_id(@user.id)
    end
    respond_to do |format|
      format.html
      format.json {head :ok}
    end
  end
end
