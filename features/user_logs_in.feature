Feature: User logs in
  A user logs in to use accessible site management features

  Scenario: A user logs in
    When I login
    Then I should see that I'm logged in

  Scenario: A user logs in with the wrong credentials
    When I login with bad credentials
    Then I should not be logged in
    And I should see an alert on the login page
