Feature: allowing managers to edit existing case manager and donor accounts
  
  As a manager
  So that I can update the database with the latest information
  I want to be able to edit case manager and donor accounts
  
Background: users have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     1    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     2    |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     3    |
  And I am on the home page

@omniauth_test
Scenario: sucessfully viewing all donor, cm, manager accounts after signing on as a manager
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "connie.guo@cs169.com"
  And I should see "eric.leung@cs169.com"
  And I should see "manduo.dong@cs169.com"
  And I should not see "markpeng@cs169.com"
  And I should see "Manage accounts"
  

@omniauth_test
@javascript
Scenario: successfully promoting a donor to case manager
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "Delete Donor"
  And I fill in "user_promotion_user_email" with "connie.guo@cs169.com"
  And I select "Case Manager" from "user_promotion_account_level"
  And I press "Change"
  And I confirm popup
  Then I should be on the accounts page
  And I should see "Successfully changed user."
  And I should not see "Delete Donor"
  # Since Connie was the only donor, this button shouldn't be anywhere on the page anymore
  
@omniauth_test
@javascript
Scenario: successfully promoting a case manager to manager
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "Delete Case Manager"
  And I fill in "user_promotion_user_email" with "eric.leung@cs169.com"
  And I select "Manager" from "user_promotion_account_level"
  And I press "Change"
  And I confirm popup
  Then I should be on the accounts page
  And I should see "Successfully changed user."
  And I should not see "Delete Case Manager"
  # Since Connie was the only case manager, this button shouldn't be anywhere on the page anymore
  
@omniauth_test
@javascript
Scenario: successfully demoting a case manager to donor
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "Delete Case Manager"
  And I fill in "user_promotion_user_email" with "eric.leung@cs169.com"
  And I select "Donor" from "user_promotion_account_level"
  And I press "Change"
  And I confirm popup
  Then I should be on the accounts page
  And I should see "Successfully changed user."
  And I should not see "Delete Case Manager"
  # Since Connie was the only case manager, this button shouldn't be anywhere on the page anymore
  
@omniauth_test
@javascript
Scenario: successfully demoting a manager to case manager
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "Delete Manager"
  And I fill in "user_promotion_user_email" with "manduo.dong@cs169.com"
  And I select "Case Manager" from "user_promotion_account_level"
  And I press "Change"
  And I confirm popup
  Then I should be on the accounts page
  And I should see "Successfully changed user."
  And I should not see "Delete Manager"
  # Since Manduo was the only case manager, this button shouldn't be anywhere on the page anymore
  
@omniauth_test
@javascript
Scenario: failing to demote a user of the same account level
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "Delete Case Manager"
  And I fill in "user_promotion_user_email" with "manduo.dong@cs169.com"
  And I select "Case Manager" from "user_promotion_account_level"
  And I press "Change"
  And I confirm popup
  Then I should be on the accounts page
  And I should see "You require additional permissions to change this user's account level."

@omniauth_test
@javascript
Scenario: failing to change an email that doesn't exist
Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  Given I have successfully completed authentication through Google
  And I am on the home page
  And I follow "Accounts"
  Then I should see "Delete Case Manager"
  And I fill in "user_promotion_user_email" with "fake.email@cs169.com"
  And I select "Case Manager" from "user_promotion_account_level"
  And I press "Change"
  And I confirm popup
  Then I should be on the accounts page
  And I should see "This user was not found. Please double check to make sure this user exists."
