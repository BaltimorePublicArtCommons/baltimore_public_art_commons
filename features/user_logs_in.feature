Feature: User logs in

  Scenario: A user wants to login
    Given that a user exists
    When I go to /login
    And fill out the fields
    And I submit the form
    Then I should be redirected to the homepage