Feature: display a list of families in the location of the donor
 
  As an altruistic donor
  So that I can quickly see low-income families in my location
  I want to donate resources to that family

Background: families and users have been added to database
  
  Given the following families exist:
  |    profile     | family_code | locationID | display | approved_by |
  | Smith profile  | SMITHCODE   |     1      | true    |    1        |
  | Brown profile  | BROWNCODE   |     1      | true    |    1        |
  | Li profile     |  LICODE     |     1      | true    |    1        |
  | Wong profile   |  WONGCODE   |     2      | true    |    1        |
  | Fong profile   |  FONGCODE   |     3      | true    |    1        |
  | Small profile  |  SMALLCODE  |     4      |	true	|    1        |
  And I am on the home page

  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     4    |
  

@omniauth_test
Scenario: see families in the location
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the donors home page
  Then I should see "SMITHCODE"
  And I should see "BROWNCODE"
  And I should see "LICODE"
  And I should not see "WONGCODE"
  And I should not see "FONGCODE"
  And I should not see "SMALLCODE"

