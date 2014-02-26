Feature: User views an item

  Scenario: A user views an item
    Given the app has a few items
    When I open the app
    And I want to see items
    And I want to see more information about the first item
    Then I should see information about that item
