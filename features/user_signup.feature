Feature: allow users to sign up to become a donor
 
  As an altruistic person
  So that I can quickly see low-income families in my location
  I want to donate resources to that families in need

@omniauth_test
Scenario: viewing signup form after clicking signup link
  # your steps here
  Given I have successfully completed authentication through Google
  Then I should be on the new user page
  And I should see the form "Sign Up"
  And I should see a field for "user_firstname"
  And the field for "user_firstname" should have "Mark"
  And I should see a field for "user_lastname"
  And the field for "user_lastname" should have "Peng"
  And I should see a field for "user_phone"
  And I should see a field for "user_address_1"
  And I should see a field for "user_address_2"
  And I should see a field for "user_city"
  And I should see a field for "user_zipcode"
  And I should see a field for "user_email"
  And the field for "user_email" should have "markpeng@cs169.com"
  And I should see a field for "user_organization"
  And I should see a field for "user_locationID"
@omniauth_test
Scenario: displaying signup confirmation notice after successful signup
  Given I have successfully completed authentication through Google
  Then I should be on the new user page
  When I fill in "user_firstname" with "Mark"
  When I fill in "user_lastname" with "Peng"
  When I fill in "user_phone" with "510-123-4567"
  When I fill in "user_address_1" with "some address"
  When I fill in "user_address_2" with "some address"
  When I fill in "user_city" with "some city"
  When I fill in "user_zipcode" with "some zipcode"
  When I fill in "user_email" with "markpeng@cs169.com"
  When I fill in "user_organization" with "cs169"
  And I press "Submit"
  Then I should be on user main page
  And I should see "User was successfully created."
