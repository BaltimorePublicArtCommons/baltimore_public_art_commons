Feature: User opens the app

  Scenario: A user opens the app
    When I open the app
    Then I should see the home page

  Scenario: A user wants to see the about page
    When I open the app
    And I want to read more about the app
    Then I should see the about page

  Scenario: A user wants to see items
    Given the app has a few items
    When I open the app
    And I want to see items
    Then I should see items
