Feature: User logs in

  Background:
    Given there is a user with email "foo@bar.com" and password "foobar"
    When I go to /login

  Scenario: A user wants to login
    When I login as "foo@bar.com" with password "foobar"
    Then I should be redirected to the homepage

  Scenario: A user logs in with the wrong credentials
    When I login as "foo@bar.com" with password "poobar"
    Then I should see an alert on the login page

