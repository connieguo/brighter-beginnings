Feature: display a list of families in the location of the donor
 
  As an altruistic donor
  So that I can quickly see low-income families in my location
  I want to donate resources to that family

Background: families have been added to database
  
  Given the following families exist:
  | surname | size | location |
  | Smith   | 5    | Oakland  |
  | Brown   | 6    | Richmond |
  | Li      | 4    | Antioch  |			

  And I am on the home page

Scenario: see families in the location
  # your steps here
  Given I have logged in as a donor
  And I am on the donors home page
  And I am from the Antioch location
  Then I should see the family "Li"
  And I should not see the family "Brown"
  And I should not see the family "Smith"

