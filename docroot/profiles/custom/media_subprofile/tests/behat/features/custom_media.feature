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

  Scenario: Media filters are present
    Given I am logged in as a user with the "media_creator" role
    And media entities:
      | bundle    | name             | embed_code                                                  | status | field_media_in_library |
      | tweet     | I'm a tweet      | https://twitter.com/50NerdsofGrey/status/757319527151636480 | 1      | 1                      |
      | instagram | I'm an instagram | https://www.instagram.com/p/BaecNGYAYyP/                    | 1      | 1                      |
    When I visit "/admin/content/media"
    Then I should see "Publishing status"
    And I should see "Provider"
    And I should see "Media name"
    And I should see "Language"

  Scenario: Media filters are functional
    Given I am logged in as a user with the "media_creator" role
    And media entities:
      | bundle    | name             | embed_code                                                  | status | field_media_in_library |
      | tweet     | I'm a tweet      | https://twitter.com/50NerdsofGrey/status/757319527151636480 | 1      | 1                      |
      | instagram | I'm an instagram | https://www.instagram.com/p/BaecNGYAYyP/                    | 1      | 1                      |
    When I visit "/admin/content/media"
    And I select "Tweet" from "Provider"
    And I press the "Apply" button
    Then I should see "I'm a tweet"
    And I should not see "I'm an instagram"

  Scenario: Media actions are present
    Given I am logged in as a user with the "media_creator" role
    And media entities:
      | bundle    | name             | embed_code                                                  | status | field_media_in_library |
      | tweet     | I'm a tweet      | https://twitter.com/50NerdsofGrey/status/757319527151636480 | 1      | 1                      |
      | instagram | I'm an instagram | https://www.instagram.com/p/BaecNGYAYyP/                    | 1      | 1                      |
    When I visit "/admin/content/media"
    Then I should see "Action"

  Scenario: Media actions are functional
    Given I am logged in as a user with the "media_creator" role
    And media entities:
      | bundle    | name             | embed_code                                                  | status | field_media_in_library |
      | tweet     | I'm a tweet      | https://twitter.com/50NerdsofGrey/status/757319527151636480 | 1      | 1                      |
      | instagram | I'm an instagram | https://www.instagram.com/p/BaecNGYAYyP/                    | 1      | 1                      |
    When I visit "/admin/content/media"
    And I should see "I'm a tweet"
    And I should see "I'm an instagram"
    And I select "Delete media" from "Action"
    And I check the box "Select all rows in this table"
    And I press the "Apply to selected items" button
    Then I should not see "I'm a tweet"
    And I should not see "I'm an instagram"
