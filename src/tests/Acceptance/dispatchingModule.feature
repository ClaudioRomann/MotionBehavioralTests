Feature: dispatchingModule
  In order to test Dispatching Module
  As an User
  I need to be able to see Disposition Module

  Scenario: Successful login and access dispatching Module
    Given I am on the login page
    When I fill in Email-Address with "cr" shortName
    And I fill in Password with "test"
    And I click Login button
    And I click on the Dispatching link
