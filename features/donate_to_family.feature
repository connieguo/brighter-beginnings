Feature: allow donors to donate to a family
  
  As an altruistic donor
  So that I can provide a family in need some useful resources
  I want to be able to choose a family in the Adopt-a-Family program
  
Background: users have already registered with our site and families and family members have been added to the database
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |

  Given the following families exist:
  |    profile     | family_code | locationID | display | approved_by |
  | Smith profile  | SMITHCODE   |     1      | true    | 1           |
  | Brown profile  | BROWNCODE   |     1      | true    | 1           |
  | Li profile     |  LICODE     |     1      | true    | 1           |
  | Wong profile   |  WONGCODE   |     2      | true    | 1           |
  | Fong profile   |  FONGCODE   |     3      | true    | 1           |
  | Small profile  |  SMALLCODE  |     4      |	true	| 1           |

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

@omniauth_test 
Scenario: viewing details and family members for a particularly family
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "SMITHCODE"
  Then I should be on the SMITHCODE Details Page
  Then I should see "Carol"
  And I should see "Bob"

@omniauth_test
Scenario: going to donate page for family
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "SMITHCODE"
  And I am on the SMITHCODE Details Page
  And I follow "Adopt this Family!"
  Then I should be on the SMITHCODE Donate Page

@javascript
@omniauth_test
Scenario: fill out donate form successfully
  Given I have successfully completed authentication through Google
  And I am on the user main page
  And I follow "SMITHCODE"
  And I am on the SMITHCODE Details Page
  And I follow "Adopt this Family!"
  And I am on the SMITHCODE Donate Page
  And I press "Donate"
  And I confirm popup
  Then I am on the user main page
