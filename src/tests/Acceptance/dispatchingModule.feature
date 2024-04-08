Feature: dispatchingModule
  In order to test Dispatching Module
  As an User
  I need to be able to see Disposition Module

  Scenario: Successful login, access to dispatching Module and successful logout
    Given I am on the login page
    When I fill in Email-Address with "cr" shortName
    And I fill in Password with "test"
    Then I click Login button
    And I click on the Dispatching link
    Then I should see Disposition Tab
    When I click on Logout
    Then I should see Logout Text
