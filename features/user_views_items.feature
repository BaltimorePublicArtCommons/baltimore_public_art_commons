Feature: User views items
  A user views items to learn more about the collection

  Scenario: A user views an item
    Given there are a few items
    When I go to the items page
    And I want to see more information about an item
    Then I should see information about that item

  Scenario: A user views more items
    Given there are many items
    When I go to the items page
    And I want to see more items
    Then I should see the next page of items
