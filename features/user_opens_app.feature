Feature: User opens the app

  Scenario: A user opens the app
    Given the app has many items
    When I open the app
    Then I should only see 12 items on the page
    And I should see that more pages are available

  Scenario: A user wants to see more content
    Given the app has many items
    When I open the app
    And I want to see more content
    Then I should see the second page of content
    And I should see 12 or fewer items on the page

  Scenario: A user wants to see the about page
    When I open the app
    And I want to read more about the app
    Then I should see the about page
