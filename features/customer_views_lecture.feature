Feature: Customer views lecture
  In order to find out about events
  A Customer
  Wants to see lecture information

  Background:
    Given Lectures:
      | title                   | time             | details                    |
      | September Space Lecture | 14/09/2111 18:30 | 'About Space' by Doctor XX |
      | January Space Lecture   | 14/01/2111 18:30 | 'The Past' by Doctor Y     |

  Scenario: Customer views active event
    When I go to the lecture page for "default", "September Space Lecture"
    Then I should see "September Space Lecture"
    And I should see "Mon 14 Sep"
    And I should see "'About Space' by Doctor XX"

  Scenario: Customer views upcomming events list
    When I go to the series page for "default"
    Then I should see "September Space Lecture"
