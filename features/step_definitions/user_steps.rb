Given /^the following users exist:$/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create ({:email => user["email"], :firstname => user["firstname"],
                  :lastname => user["lastname"], :locationID => user["locationID"],
                  :identity => user["identity"]})
  end
end

Given /^I have successfully completed authentication through Google$/ do
  visit '/auth/google/'
end

Then /^I should have session name "([^"]*)"$/ do |arg1|
  if !(page.body.include?("<a href=\"/profile\">Mark Peng</a>"))
    assert false, "Session name #{arg1} was not found in #{page.body}."
  end
end

Given /^I have unsuccessfully completed authentication through Google$/ do
  visit '/auth/failure'
end

When /^(?:|I )delete "([^"]*)"$/ do |email|
  @uid = User.find_by_email(email).id
  click_link("user_#{@uid}")
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept
end


