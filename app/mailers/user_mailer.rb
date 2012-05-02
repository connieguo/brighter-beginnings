class UserMailer < ActionMailer::Base
  default from: "bb.casemanager169@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}>", :subject => "Welcome to the BrighterBeginnings Adopt-a-Family Program!")
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
