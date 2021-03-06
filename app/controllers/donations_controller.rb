class DonationsController < ApplicationController
  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    @family = Family.find(params[:id])
    @donation = Donation.new()
    session[:family_code] = @family.family_code
    @family_members = FamilyMember.find_all_by_family_code(@family.family_code)
    @display = []
    @family_members.each do |family_member|
       @display << family_member.firstname
    end
    @display = @display.join(', ')
    @display = @display.gsub(/(.*),(.*)/, '\1 and\2')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(params[:donation])
    @user = User.find_by_email(session[:user_email])
    @donation.user_id = @user.id
    @donation.family_code = session[:family_code]
    @family = Family.find_by_family_code(session[:family_code])
    respond_to do |format|
      if @donation.save
        @family.display = false
        @family.save
        session[:family_code] = nil
        format.html { redirect_to "/users/main", notice: 'Your request has been successfully entered! We will send you an email confirmation with details once the adoption has been approved. Thanks for your generosity!', confirm: 'Are you sure' }
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.html { render action: "new" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to "/users/donations", notice: 'Donation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation = Donation.find(params[:id])
    @donor = User.find_by_id(@donation.user_id)
    @donation.destroy
    @family = Family.find_by_family_code(@donation.family_code)
    @family.display = true
    @family.save

    respond_to do |format|
      format.html { redirect_to "/users/donations", notice: "Successfully deleted donation!" }
      format.json { head :ok }
    end
  end

  def pending
    @donations = Donation.find(:all, :conditions=>"approved_by IS NULL")
    session[:redirect_path] = pending_donations_path
    respond_to do |format|
      format.html 
      format.json { head :ok }
    end
  end
  def approve
     @user = User.find_by_email(session[:user_email])
     @donation = Donation.find(params[:id])
     @donor = User.find_by_id(@donation.user_id)
     @donation.approved_by = @user.id
     if @donation.save
        @donor.notify_donation_approved(@donation)
	      flash[:notice] = "Successfully approved #{@donation.id}."
     else
	      flash[:error] = "Sorry, something went wrong with the approval. Please try again."
     end
     redirect_to session[:redirect_path]
  end
  
  def email_template
    @template = EmailTemplate.get_current_template
    if @template
      @filled_template = fill_template(@template.template_body)
    end
    respond_to do |format|
      format.html
      format.json {head :ok}
    end
  end
  
  def new_email_template
    body = params[:email_template][:template]
    template = EmailTemplate.create(:editor_name => session[:user_name], :template_body => body)
    if template.save
      flash[:notice] = "Successfully added template!"
    else
      flash[:error] = "Sorry, there was an error, please try again."
    end
    respond_to do |format|
      format.html { redirect_to email_template_path }
      format.json { head :ok }
    end
  end
end
