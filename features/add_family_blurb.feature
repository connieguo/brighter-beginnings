Feature: show a blurb about a new family
 
  As a case manager
  So that I can quickly add information about a new family
  I want to include that family in the list for donors

Background: families have been added to database
  
  Given the following families exist:
  | surname | size | location |
  | Smith   | 5    | Oakland  |
  | Brown   | 6    | Richmond |
  | Li      | 4    | Antioch  |			

  And I am on the home page

Scenario: add blurb about family "Lin"
  # your steps here
  Given I have logged in as a case manager
  And I click on "Add New Family"
  And I write a blurb about family "Lin"
  And I click "Submit"
  Then I should be on the case manager home page
  And I should see Lin family blurb as a pending item



