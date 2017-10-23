@media @image @api
Feature: Custom media types and fields

  Scenario: Custom media field is migrated
    Given I am logged in as a user with the media_creator role
    When I visit "/media/add"
    And I click "Image"
    Then I should see "New Field"
