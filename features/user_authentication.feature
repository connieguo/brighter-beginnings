Feature: allow users to sign in as a donor
  
  As an altruistic person
  So that I can log into the website with my Google account
  I want to authenticate the site with my basic Google account information
  
Background: users have already registered with our site
  
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      0     |     0    |

Scenario: seeing the sign in link if you are not logged in

  Given I am on the home page
  Then I should see "Sign In"

@omniauth_test
Scenario: seeing confirmation after successful authentication
  Given I have successfully completed authentication through Google
  Then I should be on the user main page
  And I should see "Login successful! Welcome back, Mark Peng"
  And I should have session name "Mark Peng"
  And I should not see "Sign In"
  And I should see "Mark Peng"
  And I should see "Logout"
  
Scenario: seeing an error message after unsuccessful authentication
  #Knowing Google automatically directs back to 'auth/failure' after failed authentication
  Given I have unsuccessfully completed authentication through Google
  Then I should be on the home page
  And I should see "There was a problem with logging in, please click the Sign In button and try again"
  And I should see "Sign In"

@omniauth_test
Scenario: seeing a confirmation after logging out
  Given I have successfully completed authentication through Google
  And I follow "Logout"
  Then I should be on the home page
  And I should see "Successfully logged out."
