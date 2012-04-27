Feature: allowing case managers to approve pending donations
  
  As a case manager
  So that I can view donations donors made
  I want to approve pending donations submitted by donors
  
Background: donors have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      0     |     3    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     2    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     1    |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     4    |

  Given the following families exist:
  |    profile     | family_code | locationID | display |  approved_by  |
  | Smith profile  | SMITHCODE   |     1      | true    |  1            |
  | Brown profile  | BROWNCODE   |     1      | true    |               |
  | Li profile     |  LICODE     |     1      | true    |               |
  | Wong profile   |  WONGCODE   |     1      | true    |               |
  
  And I am on the home page
  
@javascript
@omniauth_test
Scenario: a donor should receive an email confirmation once the donation has been approved
  Given I have successfully completed authentication through Google
  And I am on the case manager main page
  And I follow "View Donations"
  Then I should be on "Donations Page"
  And I hit approve
  Then I should see "donation confirmation email has been sent to the donor"

