Feature: allowing managers to view a list of all accounts and selectively delete
  
  As a manager
  So that I can ensure that registered donors are committed to the program
  I want to be able to delete donor accounts
  
Background: donors have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     1    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     2    |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     4    |
  And I am on the home page

@omniauth_test
Scenario: sucessfully viewing all donor, cm, manager accounts after signing on as a manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  Then I should see "connie.guo@cs169.com"
  And I should see "eric.leung@cs169.com"
  And I should see "markpeng@cs169.com"
  And I should not see "manduo.dong@cs169.com"
  

@omniauth_test
@javascript
Scenario: successfully deleting donor
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I delete "connie.guo@cs169.com"
  And I confirm popup
  Then I should not see "connie.guo@cs169.com"

@omniauth_test
@javascript
Scenario: successfully deleting case manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I delete "eric.leung@cs169.com"
  And I confirm popup
  Then I should not see "eric.leung@cs169.com"

@omniauth_test
@javascript
Scenario: choosing not to delete user after prompt
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I delete "connie.guo@cs169.com"
  And I dismiss popup
  Then I should see "connie.guo@cs169.com"
