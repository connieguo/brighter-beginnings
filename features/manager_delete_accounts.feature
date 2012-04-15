Feature: allowing managers to view a list of all accounts and selectively delete
  
  As a manager
  So that I can ensure that registered donors are committed to the program
  I want to be able to delete donor accounts
  
Background: donors have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following donors exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     1    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     1    |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     1    |
  And I am on the home page

@omniauth_test
# sign in as mark with omniauth
Scenario: sucessfully viewing all donors after signing on as a manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I click "View All Accounts"
  Then I should see "connie.guo@cs169.com"
  And I should see "eric.leung@cs169.com"
  And I should not see "markpeng@cs169.com"
  And I should not see "manduo.dong@cs169.com"
  
@omniauth_test
Scenario: successfully deleting a donor account
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I click "View All Accounts"
  And I see "connie.guo@cs169.com"
  And I click "Connie_Delete"
  And I see "Are you sure you want to delete this user?"
  And I click "Yes"
  Then I should see "User connie.guo@cs169.com has been successfully deleted."

@omniauth_test
Scenario: choosing not to delete user after prompt
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I click "View All Accounts"
  And I see "connie.guo@cs169.com"
  And I click "Connie_Delete"
  And I see "Are you sure you want to delete this user?"
  And I click "No"
  Then I should see "connie.guo@cs169.com"

