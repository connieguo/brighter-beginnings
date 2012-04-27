Feature: allowing managers to create new case manager accounts
  
  As a manager
  So that I can hire new case managers to the project
  I want to be able to create case manager accounts
  
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
Scenario: successfully promoting user to case manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I promote "connie.guo@cs169.com" to "Case Manager"
  And I confirm popup
  Then I should see "Connie Guo is now a case manager."
  And I should not see "connie.guo@cs169.com" before "Case Manager" 
  And I should see "connie.guo@cs169.com" after "Case Manager" 
  And I should not see "connie.guo@cs169.com" after "Manager"

@omniauth_test
@javascript
Scenario: choosing not to promote user to case manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I promote "connie.guo@cs169.com" to "Case Manager"
  And I dismiss popup
  Then I should see "connie.guo@cs169.com" before "Case Manager" 
  And I should not see "connie.guo@cs169.com" after "Case Manager"

@omniauth_test
@javascript
Scenario: attempting to promote someone that is already a case manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I promote "eric.leung@cs169.com"
  And I confirm popup
  Then I should see "Eric Leung is already a case manager."
  And I should not see "eric.leung@cs169.com" before "Case Manager" 
  And I should see "eric.leung@cs169.com" after "Case Manager" 
  And I should not see "eric.leung@cs169.com" after "Manager"
  
@omniauth_test
@javascript
Scenario: attempting to promote someone that is a manager
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I promote "manager@cs169.com"
  And I confirm popup
  Then I should see "Mr Manager is a manager. You do not have permission to make this user a case manager."
  And I should not see "manager@cs169.com" before "Manager" 
  And I should see "manager@cs169.com" after "Manager"
  
@omniauth_test
@javascript
Scenario: attempting to promote someone that is a superuser
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Accounts"
  And I promote "manduo.dong@cs169.com"
  And I confirm popup
  Then I should see "Manduo Dong is a superuser. You do not have permission to make this user a case manager"
  And I should not see "manduo.dong@cs169.com"
