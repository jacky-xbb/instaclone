Feature: User sign up
  As a new user
  I want to sign up for an account
  So that I can use the platform's features

  Scenario: Successful sign up
    Given I am on the sign up page
    When I fill in the sign up form correctly
    And I submit the sign up form
    Then I should be signed up and logged in
