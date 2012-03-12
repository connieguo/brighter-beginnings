Feature: filter a list of families in the location of the donor by a specific attribute such as family size
 
  As an altruistic donor
  So that I can choose a family with a specific attribute
  I want to donate resources to that family

Background: families have been added to database
  
  Given the following families exist:
  | surname | size | location |
  | Smith   | 5    | Oakland  |
  | Brown   | 6    | Richmond |
  | Li      | 4    | Antioch  |			
  | Wong    | 10   | Antioch  |
  | Patel   | 7    | Antioch  |
  And I am on the home page

Scenario: see families in the location
  # your steps here
  Given I have logged in as a donor
  And I am on the donors home page
  And I am from the Antioch Location
  And I select "Filter by Family Size"
  And for minimum size I enter "5"
  Then I should see the family "Wong"
  And I should see the family "Patel"
  And I should not see the family "Smith"
  And I should not see the family "Brown"
  And I should not see the family "Li"

