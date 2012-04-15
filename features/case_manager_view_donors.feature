Feature: allowing case managers to view a list of all donors
  
  As a case manager
  So that I can see all registered donors for the Adopt-a-Family program
  I want to view a list of donors
  
Background: donors have already registered with our site
  
  # identity - 1: donor, 2: case manager, 3: manager, 4: superuser
  Given the following donors exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     2    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     1    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     1    |
  And I am on the home page

@omniauth_test
Scenario: sucessfully viewing all donors after signing on as a case manager
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I click "View All Donors"
  Then I should see "connie.guo@cs169.com"
  And I should see "eric.leung@cs169.com"
  And I should not see "markpeng@cs169.com"
  

