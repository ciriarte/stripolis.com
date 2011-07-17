Feature: Log-in
  In order to view my profile
  As a Registered member
  I want to be required to log-in
  Background:
    Given I am the registered member "beatrice"
    And I am on the login page

  Scenario: Beatrice logs in succesfully
    When I fill in "email" with "beatrice@hell.com"
    And I fill in "password" with "dante"
    And I press "Login"
    Then I should see "The Stage" in the title

  Scenario: Beatrice enters a bad password
    When I fill in "email" with "beatrice@hell.com"
    And I fill in "password" with "bad password"
    And I press "Login"
    Then I should see "Couldn't log you in as 'beatrice@hell.com'"
  
  Scenario: Beatrice enters a bad email
    When I fill in "email" with "beatriz@hell.com"
    And I fill in "password" with "dante"
    And I press "Login"
    Then I should see "Couldn't log you in as 'beatriz@hell.com'"

  Scenario: Beatrice has checked remember me
    When I fill in "email" with "beatrice@hell.com"
    And I fill in "password" with "dante"
    And I check remember me
    And I press "Login"
    And I close my browser
    And I come back
    Then I should see "The Stage" in the title

  Scenario: Beatrice forgets her password
    When I am on the login page
    And I click on 'Forgot your password?'
