Feature: Customer views lecture
  In order to find out about events
  A Customer
  Wants to see lecture information

  Scenario: Customer views active event
    Given Lectures:
      | title                   | time             | details                    |
      | September Space Lecture | 14/09/2011 18:30 | 'About Space' by Doctor XX |
    When I go to the lecture page for "September Space Lecture"
    Then I should see "September Space Lecture"
    Then I should see "Wed 14 Sep"
    Then I should see "'About Space' by Doctor XX"

