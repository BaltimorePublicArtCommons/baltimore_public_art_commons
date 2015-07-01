Feature: User accepts invite

  Background:
    Given I am an unconfirmed user

  Scenario: An unconfirmed user navigates to the confirmation page
    When I navigate to the confirmation page
    And I set my password
    Then I should see a success message

  Scenario: A user navigates to the confirmation page without the confirmation hash
    When I navigate to the confirmation page without a confirmation hash
    Then I should be redirected to the homepage
    And I should see an error message
