Feature: Admin invites a new user

  Background:
    Given that there is an admin with the email "baz@bar.com", password "foobar", first_name "Quxbar"
    When I log in

  Scenario: An admin wants navigate to the invite form
    When I login as "baz@bar.com" with the password "foobar"
    Then I should see a link to /invite in the secondary header