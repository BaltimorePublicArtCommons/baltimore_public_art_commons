Feature: User views artists listing
  Background:
    Given the app has a few artists

  Scenario: A user views the listing of artists
    When I open the app
    And I want to see a listing of the artists
    Then I should see 12 or fewer artists

  Scenario: A user views an artist
    When I visit the artists page
    And I want to see more information about the first artist
    Then I should see information about the first artist
