Feature: allow case managers to add a blurb about a new families
  
  As a case manager
  So that I can quickly add information about a family to the Adopt-a-Family Program
  I want to enter blurbs about families
  
Background: users have already registered with our site and families have been added to the database
  
  # identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      0     |     2    |

  Given the following families exist:
  |    profile     | family_code | locationID | display |
  | Smith profile  | SMITHCODE   |     1      | true    |
  | Brown profile  | BROWNCODE   |     1      | true    |
  | Li profile     |  LICODE     |     1      | true    |
  | Wong profile   |  WONGCODE   |     2      | true    |
  | Fong profile   |  FONGCODE   |     3      | true    |
  | Small profile  |  SMALLCODE  |     4      |	true	|
  And I am on the home page

@omniauth_test
Scenario: successfully reaching the 'Add Family Blurb' button
  Given I have successfully completed authentication through Google
  And I am on the user main page
  Then I should see "Add New Family"

@omniauth_test
Scenario: going to the add new family form after clicking "Add a New Family Profile"
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "All Families"
  And I follow "Add New Family"
  Then I should see "Family Code"
  And I should see "Family Profile"
  And I should see "Location"

@omniauth_test
@javascript
Scenario: successfully adding new family profile
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "All Families"
  And I follow "Add New Family"
  And I fill in "Family Code" with "OCA123"
  And I fill in "Family Profile" with "Test Profile"
  And I select "Oakland" from "Location"
  And I press "Create New Family"
  And I confirm popup
  And I should see "Family was successfully created."

@omniauth_test
@javascript
Scenario: not entering all fields correctly
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "All Families"
  And I follow "Add New Family"
  And I fill in "Family Profile" with "Test Profile"
  And I select "Oakland" from "Location"
  And I press "Create New Family"
  And I confirm popup
  Then I should see "Sorry, one or more fields were not entered correctly. Please double-check that the information is correct."

@omniauth_test
@javascript
Scenario: viewing successfully added blurb in Pending Family Profiles
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "All Families"
  And I follow "Add New Family"
  And I fill in "Family Code" with "OCA123"
  And I fill in "Family Profile" with "Test Profile"
  And I select "Oakland" from "Location"
  And I press "Create New Family"
  And I confirm popup
  And I follow "View pending families info"
  Then I should see "OCA123"
