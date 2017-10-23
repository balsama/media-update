# Lightning Contrib to Core Media update test
This repo exists to test the Core Media update in more complicated scenarios not
covered in Lightning's default test suite.

See: https://github.com/acquia/lightning/issues/489

## Setup
* The repo contains a sub-profile of Lightning that defines a few extra media
configurations expoered as config.
* The config is exported to the config sync directory defined in setting.php.
* The subprofile defines `config_install: true` in its info file and the project
  applies patch #81 from Issue #2788777 so that new installs always import
  config on top of whats defined in the profiles/modules.
* There are some basic behat tests in the profile that test the profile's cofig
  in addition to the media tests provided by Lightning.

## Test Outline
1. Application is installed as-is from this repo
1. Update to branch of Lightning with core media migration
1. **Rebuild Drupal caches**
1. Run Database Updates
1. Run Lightning updates
1. Run Lightning Media tests plus custom tests
1. ~~**Uninstall `media_entity` module**~~ *Done
1. Export config
1. Re-install site from fresh, post-update config
1. Run tests again

* Steps in **bold** should be part of the update and should not be needed here. 