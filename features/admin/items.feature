Feature: Item administration

  Background:
    Given the app has many items
      And I'm logged in as an admin

  Scenario: The dashboard initially shows a list of items
    Then I should see a list of items

