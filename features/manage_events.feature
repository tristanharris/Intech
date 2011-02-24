Feature: Manage events
  In order to provide events
  Intech
  wants event administration

  Scenario: Register new event
    Given I am on the new event page
    When I fill in "Title" with "The Universe"
    And I select "01/05/2011 18:30" as the "Time" date and time
    And I press "Create"
    Then I should see "The Universe"
    And I should see "01/05/2011 18:30"
