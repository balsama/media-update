@media @image @api
Feature: Custom media types and fields

  Scenario: Custom media field is migrated
    Given I am logged in as a user with the media_creator role
    When I visit "/media/add"
    And I click "Image"
    Then I should see "Image source"

  Scenario: Media reference field is migrated
    Given I am logged in as a user with the "media_creator,media_reference_node_creator" roles
    When I visit "node/add/media_reference_node"
    And the response status code should be 200
    Then I should see "Media Reference Field"
