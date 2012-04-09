Feature: allow users to sign up to become a donor
 
  As an altruistic person
  So that I can quickly see low-income families in my location
  I want to donate resources to that families in need

Scenario: viewing signup form after clicking signup link
  # your steps here
  Given I have successfully authenticated with email "connie.guo@berkeley.edu"
  And the account I authenticated has name "Connie Guo"
  And the account I authenticated has firstname "Connie"
  And the account I authenticated has lastname "Guo"
  And I am on the new user page
  And I should see the form "Sign Up"
  And I should see a field for "user_firstname"
  And the field for "user_firstname" should include "Connie"
  And I should see a field for "user_lastname"
  And the field for "user_lastname" should include "Guo"
  And I should see a field for "user_phone"
  And I should see a field for "user_address"
  And I should see a field for "user_email"
  And the field for "user_email" should include "connie.guo@berkeley.edu"
  And I should see a field for "user_organization"
  And I should see a field for "user_locationID"
  And I should see the button "Submit"

Scenario: displaying signup confirmation notice after successful signup

  Given I have successfully authenticated with email "connie.guo@berkeley.edu"
  And the account I authenticated has name "Connie Guo"
  And the account I authenticated has firstname "Connie"
  And the account I authenticated has lastname "Guo"
  And I am on the new user page
  And I have entered "Connie" for field "user_firstname"
  And I have entered "Guo" for field "user_lastname"
  And I have entered "510-123-4567" for "user_phone"
  And I have entered "some address" for "user_address"
  And I have entered "connie.guo@berkeley.edu" for "user_email"
  And I have entered "cs169" for "user_organization"
  And I have selected "Oakland" for "user_locationID"
  And I click "Submit"
  Then I should be redirected to the family list page
  And I should see "User was successfully created."
