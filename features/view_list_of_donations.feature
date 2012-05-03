Feature: allowing donors to view a list of recently approved and pending donations
 
  As an altruistic donor
  So that I know when to begin donating my resources to a family
  I want to view a list of recently approved and pending donations

Background: families have been added to database
  
  Given the following families exist:
  |    profile     | family_code | locationID | display | approved_by |
  | Smith profile  | SMITHCODE   |     1      | true    |  2          |
  | Brown profile  | BROWNCODE   |     1      | true    |  2          |
  And I am on the home page

  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | eric.leung@cs169.com   |   Eric   |   Leung   |      1     |     1    |
  | connie.guo@cs169.com |   Connie  |   Guo    |      1     |     4    |
  
  Given the following family members exist:
  |  family_code | firstname | age | gender | comment | pant_size | shirt_size | dress_size | shoe_size | wishlist |
  |  SMITHCODE   | Carol | 4 | F | None | S | S | S | S | Barbie |
  |  SMITHCODE   | Bob   | 45| M | None | L | L | L | L | food   |
  |  BROWNCODE   | George| 10| M | None | M | M | M | M | toys   |

  Given the following donations exist:
  | scheduled_dropoff | dropped_off_date | date_delivered | family_code | user_id | dropoff_site | approved_by |
  |                   |                  |                | SMITHCODE   |  1      | 1            |             |
  |                   |                  | 04/26/2012     | BROWNCODE   | 1       | 1            | 2           |

@omniauth_test
@javascript
Scenario: see list of approved donations as donor
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |
  Given I have successfully completed authentication through Google
  And I am on the donors home page
  And I follow "Your Donations"
  Then I should see "Approved" after "BROWNCODE"

@omniauth_test
@javascript
Scenario: see list of pending donations as donor
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |
  Given I have successfully completed authentication through Google
  And I am on the donors home page
  And I follow "Your Donations"
  Then I should see "Waiting for approval" after "SMITHCODE"

@omniauth_test
@javascript
Scenario: seeing list of approved donations as a case manager+
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "All Donations"
  Then I should see "Approved" after "BROWNCODE"

@omniauth_test
Scenario: seeing list of pending donations as a case manager+
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     3    |
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "All Donations"
  And I follow "(View pending donations)"
  Then I should see "SMITHCODE"

