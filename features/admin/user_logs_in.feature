Feature: Admin logs in

  Background:
    Given there is a user with email "foo@bar.com", password "foobar" and first_name "Bazbar"
      And I go to /login

  Scenario: Admin wants to login
    When I login as "foo@bar.com" with password "foobar"
    Then I should be redirected to the admin dashboard

  Scenario: A user logs in with the wrong credentials
    When I login as "foo@bar.com" with password "poobar"
    Then I should see an alert on the login page

  Scenario: A user cannot go to the admin dashboard unless he or she is logged in
    When I go to the admin dashboard without logging in
    Then I should be redirected to the login page
