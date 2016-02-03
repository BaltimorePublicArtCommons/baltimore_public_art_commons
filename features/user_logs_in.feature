Feature: User logs in
  A user logs in to administer the site

  Scenario: A user logs in
    When I login
    Then I should be logged in

  Scenario: A user logs in with the wrong credentials
    When I login with bad credentials
    Then I should not be logged in
    And I should see an alert on the login page
