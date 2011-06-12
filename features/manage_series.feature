Feature: Manage series
  In order to provide events
  Intech
  wants series administration

  Scenario: Add new series
    Given I am on the admin page
    When I follow "Add new Series"
    Then I should be on the new series page

  Scenario: Register new series
    Given I am on the new series page
    When I fill in "Title" with "Space"
    And I press "Create"
    Then I should see "Space"

  Scenario: Edit series
    Given Series:
      | title |
      | Space |
    Given I am on the admin page
    When I follow "Space"
    When I fill in "Title" with "Out there"
    And I press "Update Series"
    Then I should see "Out there"
    Then I should not see "Space"

