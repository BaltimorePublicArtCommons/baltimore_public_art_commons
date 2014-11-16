Feature: Admin invites a new user

  Background:
    Given there is a user with admin "true", email "baz@bar.com", password "foobar", first_name "Quxbar"
    And I go to /login
    And log in with email "baz@bar.com" and password "foobar"

  Scenario: An admin wants to invite a new user
    When I navigate to /invite
    Then I should send an email to an invitee at "test@invitee"

