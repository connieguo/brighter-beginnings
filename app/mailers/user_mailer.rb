class UserMailer < ActionMailer::Base
  default from: "bb.casemanager169@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Welcome to the BrighterBeginnings Adopt-a-Family Program!")
  end

  def donation_confirmation(user)
     @user = user
     @template = EmailTemplate.get_current_template.template_body
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
