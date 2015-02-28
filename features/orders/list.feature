Feature: List sorted orders
  In order to visualize orders
  As a manager
  I want to reorder orders by some fields

  Background:
    Given I visit the home
    And I click link to import a file
    When I submit valid file
    
  Scenario: Show orders order by buyer name
    Given I click link on buyer field in header table
    Then I should see orders in descending order
    When I click link on buyer field in header table 
    Then I should see orders in ascending order