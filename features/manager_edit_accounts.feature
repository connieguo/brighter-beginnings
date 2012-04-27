Feature: allowing managers to edit existing case manager and donor accounts
  
  As a manager
  So that I can update the database with the latest information
  I want to be able to edit case manager and donor accounts
  
Background: users have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     1    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     2    |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     4    |
  | manager@cs169.com    |   Mr      | Manager  |      1     |     3    |
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
Scenario: going to the edit page for a case manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I click "Edit Connie Guo's Information"
  And I confirm popup
  Then I should be on "Edit Connie's Account Page"

@omniauth_test
@javascript
Scenario: successfully editing a user's information
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I click "Edit Connie Guo's Information"
  And I confirm popup
  And I enter "Bob" for "firstname"
  And I follow "Submit"
  Then I should see "User has been successfully edited!"
  And I should be on the manager main page
  And I should see "Bob"

@omniauth_test
@javascript
Scenario: unsuccessfully editing a user's information
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I click "Edit Connie Guo's Information"
  And I confirm popup
  And I enter "" for "firstname"
  And I follow "Submit"
  Then I should see "Sorry, the firstname field cannot be empty!"
  And I should be on "Edit Connie's Account Page"
  And I should see "Connie"
  
