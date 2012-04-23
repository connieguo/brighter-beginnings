Feature: allowing managers to approve pending family blurbs
  
  As a manager
  So that I can proofread family profiles before they are visible to donors
  I want to approve pending family blurbs written by case managers
  
Background: donors have already registered with our site
  
  #identity: 1 (donor), 2 (case manager), 3 (manager), 4 (superuser)
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      0     |     3    |
  | connie.guo@cs169.com |  Connie   |   Guo    |      2     |     0    |
  | eric.leung@cs169.com |  Eric     |  Leung   |      3     |     1    |
  | manduo.dong@cs169.com|  Man      |   Dong   |      1     |     4    |

  Given the following families exist:
  |    profile     | family_code | locationID | display |  approved_by  |
  | Smith profile  | SMITHCODE   |     1      | true    |  1            |
  | Brown profile  | BROWNCODE   |     1      | true    |  NULL         |
  | Li profile     |  LICODE     |     1      | true    |  NULL         |
  | Wong profile   |  WONGCODE   |     1      | true    |  NULL         |
  
  And I am on the home page

@javascript
@omniauth_test
Scenario: successfully viewing all pending family profiles
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Approve pending families info"
  And I am on the Pending Families Page
  And I press "Filter"
  Then I should not see "SMITHCODE"
  And I should see "BROWNCODE"
  And I should see "LICODE"
  And I should see "WONGCODE"
  
@omniauth_test
Scenario: successfully approving a family profile
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Approve pending families info"
  And I follow "Smith-Approve"
  Then I should see "This family profile was successfully approved!"
  And I should not see "SMITHCODE"

@omniauth_test
Scenario: viewing family profile after successfully approving it
  Given I have successfully completed authentication through Google
  And I am on the manager main page
  And I follow "Approve pending families info"
  And I follow "Smith-Approve"
  And I follow "All Families"
  Then I should see "SMITHCODE"


