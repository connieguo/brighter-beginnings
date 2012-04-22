class FamilyMembersController < ApplicationController
  # GET /family_members
  # GET /family_members.json
  def index
    if params[:id]
    	@family = Family.find(params[:id])
        if @family
        	@family_code = @family.family_code
	        @family_members = FamilyMember.find_all_by_family_code(@family.family_code)
		@size = @family_members.count
		session[:family_id] = @family.id
        end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @family_members }
    end
  end

  # GET /family_members/1
  # GET /family_members/1.json
  def show
    @family_member = FamilyMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @family_member }
    end
  end

  # GET /family_members/new
  # GET /family_members/new.json
  def new
    @family_member = FamilyMember.new
    if params[:id]
    	@family = Family.find(params[:id])
        if @family
    		session[:family_code] = @family.family_code
        end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @family_member }
    end
  end

  # GET /family_members/1/edit
  def edit
    @family = Family.find(params[:id])
    @family_member = FamilyMember.find(params[:fm_id])
    session[:family_id] = @family.id
    session[:fm_id] = @family_member.id
  end

  # POST /family_members
  # POST /family_members.json
  def create
    @family_member = FamilyMember.new(params[:family_member])
    @family = Family.find_by_family_code(@family_member.family_code)
    respond_to do |format|
      if @family_member.save
        format.html { redirect_to family_details_path(@family), notice: 'Family member was successfully created.' }
        format.json { render json: @family_member, status: :created, location: @family_member }
      else
        format.html { render action: "new" }
        format.json { render json: @family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /family_members/1
  # PUT /family_members/1.json
  def update
    @family_member = FamilyMember.find(session[:fm_id])
    @family = Family.find(session[:family_id])
    respond_to do |format|
      if @family_member.update_attributes(params[:family_member])
        session[:family_id] = nil
        session[:fm_id] = nil
        format.html { redirect_to family_details_path(@family), notice: 'Family member was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_members/1
  # DELETE /family_members/1.json
  def destroy
    @family = Family.find(session[:family_id])
    @family_member = FamilyMember.find(params[:id])
    @family_member.destroy
    session[:family_id] = nil
    respond_to do |format|
      format.html { redirect_to family_details_path(@family), notice: 'Family member successfully deleted!' }
      format.json { head :ok }
    end
  end
end
