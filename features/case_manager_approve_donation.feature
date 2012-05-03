Feature: allowing case managers to approve pending donations
  
  As a case manager
  So that I can view donations donors made
  I want to approve pending donations submitted by donors
  
Background: donors have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity | id |
  | markpeng@cs169.com   |    Mark   |   Peng   |      0     |     3    |  1 |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     2    |  2 |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     1    |  3 |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     4    |  4 |

  Given the following families exist:
  |    profile     | family_code | locationID | display |  approved_by  |
  | Smith profile  | SMITHCODE   |     1      | true    |  1            |
  | Brown profile  | BROWNCODE   |     1      | true    |               |
  | Li profile     |  LICODE     |     1      | true    |               |
  | Wong profile   |  WONGCODE   |     1      | true    |               |
  
  Given the following donations exist:
  | family_code | user_id |
  |  SMITHCODE  |    3    |
  
  Given the following template exists:
  | template_body | editor_name |
  | Dear donor, thank you very much for your contributions to the Adopt-a-Family-Program! Each year, your contributions are responsible for improving the lives of many families and we are very grateful to your generosity. Sincerely, Brighter Beginnings | markpeng@cs169.com |
  
@omniauth_test
Scenario: successfully approving a donation
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "All Donations"
  Then I should be on All Donations Page
  And I follow "View pending donations"
  Then I should see "SMITHCODE"
  And I follow "Approve Donation"
  Then I should see "Successfully approved"
  And I should not see "SMITHCODE"
