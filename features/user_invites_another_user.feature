Feature: User invites another user

  Background:
    Given I am logged in as an "admin" user

  Scenario: A user wants to invite another user
    When I click the "Invite User" link
    And I fill out the user invite form
    Then I should see a success message
