Feature: Lectures belong to series
  In order to navigate easily
  Customer
  wants to see lecures grouped by series

  Scenario: Customer views series page
    Given Series:
      | title   |
      | Space   |
      | Biology |
    Given Lectures:
      | title             | series  |
      | The Universe      | Space   |
      | The Natural World | Biology |
    When I go to the series index page
    And I follow "Space"
    Then I should see "Space"
    Then I should see "The Universe"
    And I should not see "The Natural World"

