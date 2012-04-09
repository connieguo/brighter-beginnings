Feature: display a list of families in the location of the donor
 
  As an altruistic donor
  So that I can quickly see low-income families in my location
  I want to donate resources to that family

Background: families have been added to database
  
  Given the following families exist:
  | surname | display |    profile     | family_code | locationID |
  | Smith   |  true   | Smith profile  |    123      |     1      |
  | Brown   |  true   | Brown profile  |    234      |     1      |
  | Li      |  true   | Li profile     |    456      |     1      |
  | Wong    |  true   | Wong profile   |    567      |     2      |
  | Fong    |  true   | Fong profile   |    678      |     3      |
  | Small   |  true   | Small profile  |    789      |     4      |		
  And I am on the home page

Scenario: see families in the location
  # your steps here
  Given I have logged in as a donor
  And I am on the donors home page
  And I am from the Oakland location
  Then I should see the family "Li"
  Then I should see the family "Smith"
  Then I should see the family "Brown"
  And I should not see the family "Wong"
  And I should not see the family "Fong"
  And I should not see the family "Small"
  
Scenario: no families in the location
  Given I have logged in as a donor
  And I am on the donors home page
  And I am from the Fake location
  Then I should not see the family "Li"
  And I should not see the family "Smith"
  And I should not see the family "Brown"
  And I should see the family "Wong"
  And I should see the family "Fong"
  And I should see the family "Small"

