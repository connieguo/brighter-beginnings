Feature: allowing donors to view a list of recently approved and pending donations
 
  As an altruistic donor
  So that I know when to begin donating my resources to a family
  I want to view a list of recently approved and pending donations

Background: families have been added to database
  
  Given the following families exist:
  |    profile     | family_code | locationID | display | approved_by |
  | Smith profile  | SMITHCODE   |     1      | true    |  1          |
  | Brown profile  | BROWNCODE   |     1      | true    |  1          |
  And I am on the home page

  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |
  | connie.guo@cs169.com |   Connie  |   Guo    |      1     |     4    |
  
  Given the following family members exist:
  |  family_code | firstname | age | gender | comment | pant_size | shirt_size | dress_size | shoe_size | wishlist |
  |  SMITHCODE   | Carol | 4 | F | None | S | S | S | S | Barbie |
  |  SMITHCODE   | Bob   | 45| M | None | L | L | L | L | food   |
  |  BROWNCODE   | George| 10| M | None | M | M | M | M | toys   |

  Given the following donations exist:
  | scheduled_dropoff | dropped_off_date | data_delivered | family_code | user_id | dropoff_site | approved_by |
  |  05/26/2012 | | | SMITHCODE | 1 | 1 | 4 |
  |  04/25/2012 |  04/25/2012 | 04/26/2012 | BROWNCODE | 1 | 1 | 4 |
@omniauth_test
Scenario: see list of approved donations
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the donors home page
  And I follow "Donations"
  Then I should see "SMITHCODE" under "Pending Donations"
  And I should not see "BROWNCODE" under "Pending Donations"

@omniauth_test
Scenario: see list of pending donations
  Given I have successfully completed authentication through Google
  And I am on the donors home page
  And I follow "Donations"
  Then I should see "BROWNCODE" under "Approved Donations"
  And I should not see "SMITHCODE" under "Approved Donations"
