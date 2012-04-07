Feature: delete a case manager account using a manager account

As a manager
So that I can remove old case manager accounts
I want to delete the case manager in the list of accounts

Background: case manager accounts have been added in the database

Given the following accounts exist:
  | Username | type |
  | Smith    | case-manager |
  | Brown    | case-manager |
  | Li       | case-manager |
  | Chen     | manager      |
  
And I am on the account list page

Scenario: Delete a case manager account

Given I have logged in as a manager
And I check "Delete Account" next to "Smith"
And I click "Submit"
Then I should be on the account list page
And I should not see the account "Smith"
And I should see the account "Brown"
And I should see the account "Li"
And I should see the account "Chen"

Scenario: Delete your own manager account

Given I have logged in as a manager "Chen"
And I check "Delete Account" next to "Chen"
And I click "Submit"
Then I should be on the home page
And I should not be logged in

Scenario: Deleting another account of the same level fails

Given I have logged in as a manager "Joe"
And I click "Delete Account" next to "Chen"
And I click "Submit"
Then I should be on the account list page
And I should see "Cannot remove account: Chen"
