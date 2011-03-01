Feature: Booking
  In order to attent events
  Customer
  wants to book tickets

  Scenario: Customer books one lecture
    Given A lecture "The Universe"
    When I go to the lecture page for "The Universe"
    And I press "Add to basket"
    Then I should see my basket containing:
      |The Universe|

  Scenario: Customer books two different lectures

  Scenario: Customer books two tickets for one lecture

