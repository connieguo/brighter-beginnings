ActionMailer::Base.smtp_settings = {
  :address              => "smtp.brighter-beginnings.org",
  :port                 => 587,
  :domain               => "brighter-beginnings.org",
  :user_name            => "adopt-a-family",
  :password             => "99",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
