Feature: User accepts invite
  A user accepts an invite so they can help administer the site

  Scenario: A user accepts an invite
    When I follow an invite link
    And I complete registration
    Then I should be logged in

  Scenario: A user tries to accept an invite using a bad link
    When I follow a bad invite link
    Then I should be redirected to the homepage
