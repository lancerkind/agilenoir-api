# Story 2: Karate API Tests
## Overview
Add Karate API tests for the Spring Boot Hello World API. The tests should validate the existing API endpoints and 
support running against either the local application or a deployed environment.
Setup the Karate api testing framework and create a test.
Do not remove existing unit tests. Karate tests should be added alongside the existing Spring Boot tests.

# Requirements
- generate a feature file to test HelloWorldController that tests positive and negative path scenarios
- use good coding principles
- use karate-config.js to have a baseUrl that's used in all the feature files
  so that the tests can be repointed at a deployment
- Karate tests should be executable through Gradle using `./gradlew testApis`.
- The test setup should start the Spring Boot application on a port set by `karate.baseUrl` system property.

## Test Configuration

- Add a `karate-config.js` file on the test runtime classpath.
- `karate-config.js` must define a reusable `baseUrl`.
- The default `baseUrl` should target the local application.
- Allow the base URL to be overridden with a JVM system property:

  `-Dkarate.baseUrl=https://example.com`

- All feature files must use the configured `baseUrl`; do not hard-code hostnames directly in feature files.


# Layout
Create:
- `src/test/java/com/agilenoir/helloworld/karate/KarateTest.java`
- `src/test/java/com/agilenoir/helloworld/karate/hello-world.feature`
- `src/test/java/karate-config.js`

# Dependencies
- Include a JUnit 5 runner class so the tests execute with Gradle.
- Get the latest version of the Karate API testing framework:
  - 'io.karatelabs:karate-core:2.0.9' 
  - 'io.karatelabs:karate-junit6:2.0.9'


### `GET /hello`
- Status: `200`
- Content-Type is compatible with `text/plain`
- Body is exactly `Hello World`

### `GET /`
- Status: `200`
- Content-Type is compatible with `text/plain`
- Body is exactly `OK`

### `GET /health`
- Status: `200`
- JSON response contains:
  ```json
  {
    "status": "UP"
  }
  ```

### `GET /actuator/health`
- Status: `200`
- JSON response contains:
  ```json
  {
    "status": "UP"
  }
  ```

## Negative Test Scenarios
The Karate feature must verify:

### Unknown route
- Request: `GET /does-not-exist`
- Expected status: `404`

### Unsupported method
- Request: `POST /hello`
- Expected status: `405`

## Local Test Execution
Choose one implementation approach and document it:

### Preferred
Karate tests should start the Spring Boot application during the Gradle test lifecycle using a random or configured test port.

### Acceptable Alternative
Karate tests may run against a locally running application at the configured `baseUrl`, defaulting to:
`http://localhost:5000`
If this approach is used, document that the application must be started before running Karate tests.

# Execution
- Add the required Karate dependency to Gradle test dependencies.
- Configure tests to run on JUnit Platform.
- Ensure `./gradlew test testApis` runs both the existing tests and the Karate tests.
- Allow overriding karate.baseUrl using a system property, for example:
  `./gradlew test -Dkarate.baseUrl=https://example.com`

## Acceptance Criteria

- Karate dependency is added to the Gradle build.
- Karate tests are included in the Gradle test lifecycle.
- `karate-config.js` provides a reusable `baseUrl`.
- Feature files use `baseUrl` from Karate configuration.
- Tests cover positive and negative scenarios.
- Existing tests are preserved.
- `./gradlew testApis` passes.
- The implementation summary documents in `Karate readme.md`:
    - Karate version selected
    - how to run the tests locally
    - how to override the base URL for deployed environments