Feature: allow donors to donate to a family
  
  As an altruistic donor
  So that I can provide a family in need some useful resources
  I want to be able to choose a family in the Adopt-a-Family program
  
Background: users have already registered with our site and families and family members have been added to the database
  # identity - 0 (case manager), 1 (donor), 2 (manager), 3 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |

  Given the following families exist:
  |    profile     | family_code | locationID | display |
  | Smith profile  | SMITHCODE   |     1      | true    |
  | Brown profile  | BROWNCODE   |     1      | true    |
  | Li profile     |  LICODE     |     1      | true    |
  | Wong profile   |  WONGCODE   |     2      | true    |
  | Fong profile   |  FONGCODE   |     3      | true    |
  | Small profile  |  SMALLCODE  |     4      |	true	|

  Given the following family members exist:
  |  family_code | firstname | age | gender | comment | pant_size | shirt_size | dress_size | shoe_size | wishlist |
  |  SMITHCODE   | Carol | 4 | F | None | S | S | S | S | Barbie |
  |  SMITHCODE   | Bob   | 45| M | None | L | L | L | L | food   |
  |  BROWNCODE   | George| 10| M | None | M | M | M | M | toys   |

@omniauth_test
Scenario: viewing nearby families after signing in as donor
  Given I have successfully completed authentication through Google
  And I am on the user main page
  Then I should see "SMITHCODE"
  And I should see "BROWNCODE"
  And I should see "LICODE"
  And I should not see "WONGCODE"
  And I should not see "FONGCODE"
  And I should not see "SMALLCODE"
 
Scenario: viewing details and family members for a particularly family
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I click "Smith-Details"
  Then I should be on the "Smith Family Details Page"
  Then I should see "Carol"
  And I should see "Bob"

Scenario: clicking donate for an existing family
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I click "Smith-Details"
  And I am on the "Smith Family Details Page"
  And I click "Smith-Donate"
  Then I should see "An email confirmation link has been emailed to your account at markpeng@cs169.com. Thanks for your generosity!"
  

