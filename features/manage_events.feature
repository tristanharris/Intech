Feature: Manage events
  In order to provide events
  Intech
  wants event administration

  Background:
    Given Series:
      | title |
      | Space |

  Scenario: Add new event
    Given I am on the lecture admin page
    When I follow "Add new Lecture"
    Then I should be on the new event page

  Scenario: Register new event
    Given I am on the new event page
    When I fill in "Title" with "The Universe"
    And I select "01/05/2011 18:30" as the "Time" date and time
    And I select "Space" from "Series"
    And I press "Create"
    Then I should see "The Universe"
    And I should see "01/05/2011 18:30"

  Scenario: Edit event
    Given Series:
      | title          |
      | Final frontier |
    Given Lectures:
      | title                   | time             | details     |
      | The Universe            | 01/05/2011 18:30 | Interesting |
    Given I am on the lecture admin page
    When I follow "The Universe"
    When I fill in "Title" with "The Multiverse"
    And I select "Final frontier" from "Series"
    And I press "Update Lecture"
    Then I should see "The Multiverse"
    And I should see "01/05/2011 18:30"
    And I should see "Series: Final frontier"

