Feature: Registration
Background:
Given I am viewing '/'
Then I should see 'Stripolis' in the title
And I should see a 'Sign Up' button

Scenario: Successful registration
Given I have entered 'Dante Alighieri' as my name
And I have entered 'dante@hell.com' as my email
And I have entered my DOB as 'Mar 1st 1990'
And I have entered my password as 'bolgia'
When I click Sign Up
Then I should see 'The Stage' in the title

