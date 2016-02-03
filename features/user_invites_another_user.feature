Feature: User invites another user
  A user invites other users so they can help administer the site

  Scenario: A user invites another user
    When I login
    And I invite another user
    Then I should see a message that the user has been invited
