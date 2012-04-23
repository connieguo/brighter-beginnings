Feature: filter a list of families in the location of the donor by a specific attribute such as family size
 
  As an altruistic donor
  So that I can choose a family with a specific attribute
  I want to donate resources to that family

Background: families have been added to database
  
  Given the following families exist:
  |    profile     | family_code | locationID | display | approved_by |
  | Smith profile  | SMITHCODE   |     1      | true    |  1          |
  | Brown profile  | BROWNCODE   |     1      | true    |  1          |
  And I am on the home page

  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |
  
  Given the following family members exist:
  |  family_code | firstname | age | gender | comment | pant_size | shirt_size | dress_size | shoe_size | wishlist |
  |  SMITHCODE   | Carol | 4 | F | None | S | S | S | S | Barbie |
  |  SMITHCODE   | Bob   | 45| M | None | L | L | L | L | food   |
  |  BROWNCODE   | George| 10| M | None | M | M | M | M | toys   |

@omniauth_test
Scenario: see list of filtered families
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the donors home page
  And I check "family_size_2"
  And I press "Filter"
  Then I should see "SMITHCODE"
  And I should not see "BROWNCODE"

