class FamiliesController < ApplicationController
  # GET /families
  # GET /families.json
  def index
    @families = Family.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @families }
    end
  end

  # GET /families/1
  # GET /families/1.json
  def show
    @family = Family.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @family }
    end
  end

  # GET /families/new
  # GET /families/new.json
  def new
    @family = Family.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @family }
    end
  end

  # GET /families/1/edit
  def edit
    @family = Family.find(params[:id])
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(params[:family])

    respond_to do |format|
      if @family.save
        format.html { redirect_to session[:redirect_path], notice: 'Family was successfully created.' }
        format.json { render json: @family, status: :created, location: @family }
      else
        flash[:error] = "Sorry, one or more fields were not entered correctly. Please double-check that the information is correct."
        format.html { render action: "new" }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /families/1
  # PUT /families/1.json
  def update
    @family = Family.find(params[:id])
    @user = User.find_by_email(session[:user_email])
    if @user &&  @user.identity == 2
	@family.approved_by = nil
    end
    respond_to do |format|
      if @family.update_attributes(params[:family])
        format.html { redirect_to session[:redirect_path], notice: 'Family was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to session[:redirect_path] }
      format.json { head :ok }
    end
  end
  
  # List of pending families
  def pending
    session[:redirect_path] = pending_families_path
    if params[:location]
      @display_families = User.find_pending_families
      @display_families.keep_if { |family| params[:location].include?(Family.get_location_name(family.locationID)) }
    else
      @display_families = User.find_pending_families
    end
    respond_to do |format|
       format.html
    end
  end
  
  def approve
    @family = Family.find(params[:id])
    @family.approved_by = User.find_by_email(session[:user_email]).id
    if @family.save
      flash[:notice] = "Successfully approved #{@family.family_code}."
    else
      flash[:error] = "Sorry, something went wrong with the approval. Please try again."
    end
    redirect_to session[:redirect_path]
  end
end
