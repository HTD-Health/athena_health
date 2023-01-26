[![Gem Version](https://badge.fury.io/rb/athena_health.svg)](https://badge.fury.io/rb/athena_health)
[![Continuous integration](https://github.com/HealthTechDevelopers/athena_health/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/HealthTechDevelopers/athena_health/actions/workflows/ci.yml)

# AthenaHealth

Ruby wrapper for [Athenahealth API](https://docs.athenahealth.com/api/).

## Updating from gem version 1 (Mashery API) to gem version 2 (https://developer.api.athena.io/ API)

There is only one change needed to upgrade, and that is how you create a new client. 

The new signature has 3 keywords:
```AthenaHealth::Client.new(production:, client_id: secret:)```
* `production:`
  * `boolean` 
  * default `false`
  * this replaces the `version:` keyword
  * indicates if you want to access the preview enviroment or the production enviroment.
* `client_id:`
  * `string`
  * no default
  * this replaces the `key:` keyword
  * this should be your **Client ID** from the developer portal
* `secret:`
  * `string`
  * no default
  * this should be your **Secret** from the developer portal

### Example
#### Gem v1 code
Preview: 
```
client = AthenaHealth::Client.new(
  version: 'preview1',
  key: "my_client_id",
  secret: "my_secret"
)
```
Production: 
```
client = AthenaHealth::Client.new(
  version: 'v1',
  key: "my_client_id",
  secret: "my_secret"
)
```
#### Gem v2 code
Preview: 
```
client = AthenaHealth::Client.new(
  production: false,
  client_id: "my_client_id",
  secret: "my_secret"
)
```
Production: 
```
client = AthenaHealth::Client.new(
  production: true,
  client_id: "my_client_id",
  secret: "my_secret"
)
```

## Examples

For some examples of how to use this library, check out [the project wiki](https://github.com/HealthTechDevelopers/athena_health/wiki).

## Contributing

### Local development

 - Check out the repository
 - Ensure you have Ruby and the Bundler gem installed
 - Install the gem dependencies with `bundle`
 - Setup Environment Variables before testing new endpoints, you'll need the following:
  - ATHENA_TEST_CLIENT_ID
  - ATHENA_TEST_SECRET
  - ATHENA_TEST_ACCESS_TOKEN

#### Testing

You can run all of the tests using `rake`.

### Overview

Contributions from the community are very welcome, including but not limited to new endpoints, new/better documentation and refactoring.

Forking the repo and submitting pull requests is just fine.

There is no specific roadmap and so far features have been added when the community needed them.

We have tried to have all the versions be backward compatible so far. If we're going to have breaking changes, we can revisit when we have a pull request.
