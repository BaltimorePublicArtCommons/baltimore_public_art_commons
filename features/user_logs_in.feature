Feature: User logs in

  Background:
    Given there is a user with email "foo@bar.com", password "foobar" and first_name "Bazbar"
    When I go to /login

  Scenario: A user wants to login
    When I login as "foo@bar.com" with password "foobar"
    Then I should be redirected to the homepage
    And see my first_name "Bazbar" in the secodary header

  Scenario: A user logs in with the wrong credentials
    When I login as "foo@bar.com" with password "poobar"
    Then I should see an alert on the login page

  Scenario: A user cannot see the secondary header unless he or she is logged in.
    When I go to the homepage without logging in
    Then I should not see my first name "Bazbar" in the secondary header

