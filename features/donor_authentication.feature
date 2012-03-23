Feature: allow users to sign in as a donor
 
  As an altruistic donor
  So that I can quickly see low-income families in my location
  I want to be able to log into the Adopt-A-Family application

Background: donors have signed up and have been added to database
  
  Given the following donors exist:
  | username | name       | password       |           email         |                address            |    phone   |
  | cguo     | Connie Guo | cs169 password | connie.guo@berkeley.edu | 169 CS Street Berkeley, CA 94709  | 1234567890 |


Scenario: attempt to login with successful username
  Given I am on the home page
  And I see the login form
  And I enter the username "cguo"
  And I enter the password "cs169 password"
  And I click "Submit"
  Then I should be on the donors home page
  And I should see "Families in Nearby Location"

Scenario: attempt to login with unsuccessful username

  Given I am on the home page
  And I see the login form
  And I enter the username "cs169"
  And I enter the password "cs169
  And I click 'Submit"
  Then I should be on the home page
  And I should see "Sorry, that username is not registered with the Adopt-a-Family program."

