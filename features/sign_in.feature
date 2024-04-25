Feature: User sign in
  As a user
  I want to be able to sign in
  So that I can access my account

  Scenario: Successful sign in
    Given there is an existing user
    And I am on the sign in page
    When I fill in the sign in form correctly
    And I submit the form
    Then I should be logged in
