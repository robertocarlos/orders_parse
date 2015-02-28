Feature: Import orders file
  In order to save and to totalize orders
  As a manager
  I want to import orders from a file
  
  Background:
    Given I visit the home
    Then I shouldn't see imported orders
    Given I click link to import a file
  
  Scenario: Submit no file
    When I submit no file
    Then I shouldn't see imported orders
    And I shouldn't see the total

  Scenario: Submit invalid file
    When I submit invalid file
    Then I shouldn't see imported orders
    And I shouldn't see the total
      
  Scenario: Submit valid file
    When I submit valid file
    Then I should see imported orders
    And I should see the total