Feature: allowing case managers and above to edit the default email template
 
  As a case manager
  So that I can update donors with the latest information
  I want to edit the contents of the email template

Background: families have been added to database
  
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  
  Given the following template exists:
  | template_body | editor_name |
  | Dear donor, thank you very much for your contributions to the Adopt-a-Family-Program! Each year, your contributions are responsible for improving the lives of many families and we are very grateful to your generosity. Sincerely, Brighter Beginnings | markpeng@cs169.com |

@omniauth_test
Scenario: successfully editing the template
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "All Donations"
  And I follow "(View pending donations)"
  And I follow "(View/Edit Donor Email Template)" 
  And I fill in "email_template_template" with "Dear donor, This is a new template"
  And I press "Submit"
  Then I should see "Successfully added template! "
  And I should see "Dear donor, This is a new template"

  
@omniauth_test
Scenario: successfully editing the template with template fillers
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "All Donations"
  And I follow "(View pending donations)"
  And I follow "(View/Edit Donor Email Template)" 
  And I fill in "email_template_template" with "Dear {{user_name}}, with email {{user_email}}, this is a new template"
  And I press "Submit"
  Then I should see "Successfully added template! "
  And I should see "Dear Mark Peng, with email markpeng@cs169.com, this is a new template"
  
@omniauth_test
Scenario: successfully editing the template with invalid template fillers
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "All Donations"
  And I follow "(View pending donations)"
  And I follow "(View/Edit Donor Email Template)" 
  And I fill in "email_template_template" with "Dear {{user_name}}, with email {{user_email}}, this is a new template {{random_fillers}}"
  And I press "Submit"
  Then I should see "Successfully added template! "
  And I should see "Dear Mark Peng, with email markpeng@cs169.com, this is a new template {{random_fillers}}"
