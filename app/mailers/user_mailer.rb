class UserMailer < ActionMailer::Base
  default from: "bb.casemanager169@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Welcome to the BrighterBeginnings Adopt-a-Family Program!")
  end

  def donation_confirmation(user)
     @user = user
     mail(:to => "#{user.email}>", :subject => "[Brighter Beginnings] Your donation has been approved!")
     @template = EmailTemplate.find(1).template_body
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
