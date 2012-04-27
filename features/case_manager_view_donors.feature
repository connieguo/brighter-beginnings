Feature: allowing case managers to view a list of all donors
  
  As a case manager
  So that I can see all registered donors for the Adopt-a-Family program
  I want to view a list of donors
  
Background: donors have already registered with our site
  
  # identity - 1: donor, 2: case manager, 3: manager, 4: superuser
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     2    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     3    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     1    |
  And I am on the home page

@omniauth_test
Scenario: sucessfully viewing all accounts after signing on as a case manager
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "Accounts"
  Then I should see "eric.leung@cs169.com"
  And I should see "markpeng@cs169.com"
  And I should see "connie.guo@cs169.com"

@omniauth_test
Scenario: not viewing delete buttons if signed in as case manager
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "Accounts"
  Then I should not see "Delete Donor"
  And I should not see "Delete Case Manager"
  And I should not see "Delete Manager"
  
@omniauth_test
Scenario: a donor should receive an email confirmation once the donation has been approved
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "View Donations"
  Then I should be on "Donations Page"
  And I hit approve
  Then I should see "donation confirmation email has been sent to the donor"

