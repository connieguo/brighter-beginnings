class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

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
    @user = User.find(params[:id])
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
    
    @donors = User.find_all_by_identity(1)
    @case_managers = User.find_all_by_identity(2)
    @managers = User.find_all_by_identity(3)   
    
    respond_to do |format|
       format.html
    end
  end
  
end
