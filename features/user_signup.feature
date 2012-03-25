Feature: allow users to sign up to become a donor
 
  As an altruistic person
  So that I can quickly see low-income families in my location
  I want to donate resources to that families in need

Scenario: viewing signup form after clicking signup link
  # your steps here
  Given I am on the home page
  And I have clicked "Sign Up"
  Then I should be on the sign up page
  And I should see the form "Sign Up"
  And I should see a field for "name"
  And I should see a field for "address_1"
  And I should see a field for "address_2"
  And I should see a field for "city"
  And I should see a field for "state"
  And I should see a field for "zipcode"
  And I should see a field for "email"
  And I should see a field for "phone number"
  And I should see a field for "username"
  And I should see a field for "password"
  And I should see a field for "password_confirmation"
  And I should see the button "Submit"

Scenario: displaying signup confirmation notice after successful signup

  Given I am on the sign up page
  And I have entered "Connie Guo" for name
  And I have entered "169 CS Street" for address_1
  And I have entered "Berkeley" for city
  And I have entered "CA" for state
  And I have entered "94709" for zipcode
  And I have entered "connie.guo@berkeley.edu" for email
  And I have entered "1234567880" for "phone number"
  And I have entered "cguo" for username
  And I have entered "cs169password" for password
  And I have entered "cs169password" for password_confirmation
  And I click "Submit"
  Then I should see "Congratulations, your sign-up procedure was successful! Please log in to continue."

Scenario: displaying error notice after unsucessful signup

  Given I am on the sign up page
  And I have entered "169 CS Street" for address_1
  And I have entered "Berkeley" for city
  And I have entered "CA" for state
  And I have entered "94709" for zipcode
  And I have entered "connie.guo@berkeley.edu" for email
  And I have entered "1234567880" for "phone number"
  And I have entered "cguo" for username
  And I have entered "cs169password" for password
  And I have entered "cs169password" for password_confirmation
  And I click "Submit"
  Then I should see "Sorry, one or more mandatory fields was not entered. Please double-check to make sure those fields are correct."
