class UserMailer < ActionMailer::Base
  default from: "bb.casemanager169@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Welcome to the BrighterBeginnings Adopt-a-Family Program!")
  end

  def donation_confirmation(user,donation)
     @user = user
     @template = EmailTemplate.get_current_template.template_body
     if @template == nil
	@template = ""
     end
     @template = @template.gsub("{{user_name}}", @user.firstname+ " " + @user.lastname)
     @template = @template.gsub("{{user_email}}", @user.email)
     @template = @template.gsub("{{user_firstname}}", @user.firstname)
     @template = @template.gsub("{{user_lastname}}", @user.lastname)
     @template = @template.gsub("{{user_location}}", Family.get_location_name(@user.locationID))
     @template = @template.gsub("{{donation_family_code}}", donation.family_code)
     mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Your donation has been approved!") do |format|
       format.text do
         render :text => "#{@template}"
       end
     end
  end  

  def donation_rejection(user)
     @user = user
     mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Your donation has been rejected.") do |format|
       format.text do
         render :text => "Sorry, your donation has been denied. Please respond to bb.casemanager169@gmail.com if you wish to receive details."
       end    
     end 
  end

  def status_confirmation(user)
     @user = user
     case @user.identity
        when 1
           @identity = "Donor"
        when 2
           @identity ="Case Manager"
        when 3
           @identity ="Manager"
        when 4
           @identity="Super User"
     end
     mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Your status has changed.") do |format|
       format.text do
         render :text => "Your status for Brighter Beginnings has been changed to #{@identity}. Please sign in to your account at brighter.beginnings.herokuapp.com to view these new changes."
       end    
     end 
  end


  def receive(email)
    page = Page.find_by_address(email.to.first)
    page.emails.create(
      :subject => email.subject,
      :body => email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          :file => attachment,
          :description => email.subject
        })
      end
    end
  end
end
