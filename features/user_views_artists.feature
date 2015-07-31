Feature: User views artists listing

  Scenario: A user views the listing of artists
    Given the app has a few artists
    When I open the app
    And I want to see a listing of the artists
    Then I should see 12 or fewer artists

  Scenario: A user views an artist
    Given the app has a few artists
    When I open the app
    And I want to see a listing of the artists
    And I want to see more information about the first artist
    Then I should see information about the first artist
