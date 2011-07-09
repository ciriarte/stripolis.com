Feature: Log-in
  In order to view my profile
  As a Registered member
  I want to be required to log-in

  Scenario: Proper login
    Given I am the registered member "beatrice"
    And I am on the login page
    When I fill in "email" with "beatrice@hell.com"
    And I fill in "password" with "dante"
    And I press "Login"
    Then I should see "The Stage"

  Scenario: Bad password
    Given I am the registered member "beatrice"
    And I am on the login page
    When I fill in "email" with "beatrice@hell.com"
    And I fill in "password" with "bad password"
    And I press "Login"
    Then I should see "Simply enter the credentials you signed up with."
    And I should see "Couldn't log you in as 'quire@example.com'"
  
  Scenario: Bad email
    Given I am the registered member "beatrice"
    And I am on the login page
    When I fill in "email" with "beatriz@hell.com"
    And I fill in "password" with "dante"
    And I press "Login"
    Then I should see "Simply enter the credentials you signed up with."
    And I should see "Couldn't log you in as 'beatriz@hell.com'"
