Feature: User opens the app

  Scenario: A user opens the app
    Given the app has a few items
    When I open the app
    Then I should see items

  Scenario: A user wants to see the about page
    When I open the app
    And I want to read more about the app
    Then I should see the about page
