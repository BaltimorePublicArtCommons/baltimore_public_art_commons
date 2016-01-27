Feature: User searches for items
  A user searches for items to quicky find information about an item

  Background:
    Given there are a few items

  Scenario: A user searches for an item by name
    When I search for an item by name
    Then I should only see items with that name

  Scenario: A user searches for an item by neighborhood
    When I search for items by neighborhood
    Then I should only see items in that neighborhood

  Scenario: A user searches for an item by artist
    When I search for items by artist name
    Then I should only see items by that artist

  Scenario: A users searches for an item that yields no results
    When I search for items with "Something bogus"
    Then I should see that there are no items found
