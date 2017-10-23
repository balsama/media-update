@media @image @api
Feature: Custom media types and fields

  Scenario: Custom media field is migrated
    Given I am logged in as a user with the media_creator role
    When I visit "/media/add"
    And I click "Image"
    Then I should see "New Field"

  Scenario: Custom content type with media reference field is migrated
    Given I am logged in as a user with the "media_creator,custom_content_type_creator" roles
    When I visit "/node/add/custom_content_type"
    Then I should see "Image Reference Field"
