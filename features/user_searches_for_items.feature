Feature: User searches for items

  Background:
    Given there is an item named "Test Item 1" by "John Artist" in "Fells Point"
    And there is an item named "Test Item 2" by "John Artist" in "Fells Point"
    And there is an item named "Test Item 3" by "Jane Artist" in "Station North"
    And I open the app

  Scenario: A user wants to search for an item by name
    When I search for "Test Item 1"
    Then I should see 1 item that matches name "Test Item 1"

  Scenario: A user wants to search for an item by neighborhood
    When I search for "Fells Point"
    Then I should see 2 items that match neighborhood "Fells Point"

  Scenario: A user wants to search for an item by artist
    When I search for "Jane Artist"
    Then I should see 1 item that matches artist "Jane Artist"
