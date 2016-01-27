Feature: User views artists
  A user views artists to learn more about artists in the collection

  Scenario: A user views an artist
    Given the app has a few artists
    When I go to the artists page
    And I want to see more information about an artist
    Then I should see information about the artist

  Scenario: A user views more artists
    Given the app has many artists
    When I go to the artists page
    And I want to see more artists
    Then I should see the next page of artists
