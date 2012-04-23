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
    
Scenario: going to the add new family form after clicking "Add a New Family Profile"
  Given I have unsuccessfully completed authentication through Google
  And I am on the user main page
  And I click "All Families"
  And I click "Add a New Family Profile"
  Then I should see the field "Family Code"
  And I should see the field "Profile"
  And I should see the field "Location"

@omniauth_test
Scenario: successfully adding new family profile
  Given I have successfully completed authentication through Google
  And I am on the user main page
  Then I click "All Families"
  And I click "Add a New Family Profile"
  And I enter "OCA123" for "Family Code"
  And I enter "Test Profile" for "Profile"
  And I select "Oakland" for location
  And I click "Submit Profile"
  And I should see "Your family profile has been successfully created! It is now pending approval."

@omniauth_test
Scenario: not entering all fields correctly
  Given I have successfully completed authentication through Google
  And I am on the user main page
  Then I click "All Families"
  And I click "Add a New Family Profile"
  And I enter "" for "Family Code"
  And I enter "Test Profile" for "Profile"
  And I select "Oakland" for location
  And I click "Submit Profile"
  Then I should see "Sorry, one or more fields were not entered correctly. Please double-check that the information is correct."

@omniauth_test
Scenario: viewing successfully added blurb in Pending Family Profiles
  Given I have successfully completed authentication through Google
  And I am on the user main page
  Then I click "All Families"
  And I click "Add a New Family Profile"
  And I enter "OCA123" for "Family Code"
  And I enter "Test Profile" for "Profile"
  And I select "Oakland" for location
  And I click "Submit Profile"
  And I click "Pending Profiles"
  Then I should see "OCA123"
