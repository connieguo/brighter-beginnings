Feature: allowing case managers and above to edit the default email template
 
  As a case manager
  So that I can update donors with the latest information
  I want to edit the contents of the email template

Background: families have been added to database
  
  Given the following users exist:
  |        email         | firstname | lastname | locationID | identity |
  | markpeng@cs169.com   |    Mark   |   Peng   |      1     |     1    |
  
  Given the following template exists:
  | content |
  | Dear donor, Thank you very much for your contributions to the Adopt-a-Family-Program! Each year, your contributions are responsible for improving the lives of many families and we are very grateful to your generosity. Sincerely, Brighter Beginnings |

@omniauth_test
Scenario: successfully editing the template
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the case manager home page
  And I follow "Edit Template"
  And I enter "Dear donor, This is a new template" for the "template field"
  And I press "Submit"
  Then I should see "Congratulations, your template has been edited!"

@omniauth_test
Scenario: getting an error while editing template
  # your steps here
  Given I have successfully completed authentication through Google
  And I am on the case manager home page
  And I follow "Edit Template"
  And I enter "" for the "template field"
  And I press "Submit"
  Then I should see "Sorry, the template field cannot be mandatory"
