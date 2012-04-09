Feature: allow users to sign in as a donor
  
  As an altruistic person
  So that I can log into the website with my Google account
  I want to authenticate the site with my basic Google account information
  
Background: users have already registered with our site
  
  Given the following users exist:
  |        email         | firstname | lastname | locationId | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      0     |     0    |

Scenario: seeing the sign in link if you are not logged in

  Given I am on the home page
  And I am not logged in
  Then I should see a link for "Sign In"
  
Scenario: seeing the google authentication
  Given I am on the home page
  And I am not logged in
  And I click "Sign In"
  Then I should be on an "accounts.google.com/o/openid2/auth" page
  
Scenario: seeing confirmation after successful authentication
  #Knowing Google automatically directs back to 'auth/google/callback' successfully authenticated
  #and Omniauth Google returns a hash with account information to this page
  Given I have successfully completed authentication through Google
  And the account I authenticated has name "Mark Peng"
  And the account I authenticated has firstname "Mark"
  And the account I authenticated has lastname "Peng"
  And the account I authenticated has email "markpeng@cs169.com"
  Then I should be redirected to "Home"
  And I should see "Login successful! Welcome back, Mark Peng"
  And I should have session name "Mark Peng"
  And I should have session email "markpeng@cs169.com"
  And I should have session firstname "Mark"
  And I should have session lastname "Peng"
  And I should not see a link for "Sign In"
  And I should see a link for "Mark Peng"
  And I should see a link for "Logout"
  
Scenario: seeing an error message after unsuccessful authentication
  #Knowing Google automatically directs back to 'auth/failure' after failed authentication
  Given I have unsuccessfully completed authentication through Google
  Then I should be redirected to "Home"
  And I should see "There was a problem with logging in, please click the Sign In button and try again"
  And I should see a link for "Sign In"

Scenario: seeing a confirmation after logging out
  Given I have logged in with email "markpeng@cs169.com"
  And I click "Logout"
  I should be redirected to "Home"
  And I should see "Successfully logged out."
