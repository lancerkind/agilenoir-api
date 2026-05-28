# Karate API Tests

## Overview
This project uses [Karate](https://github.com/karatetabs/karate) for API testing.

## Implementation Details
- **Karate Version**: 1.5.0
- **Configuration**: `karate-config.js` defines a `baseUrl` which defaults to `http://localhost:5000`.
- **Test Runner**: `KarateTest.java` uses JUnit 5 and starts the Spring Boot application on the port defined in `application.properties`.

## How to run the tests locally
To run all tests (including unit and API tests):
```bash
./gradlew test
```

To run only Karate API tests:
```bash
./gradlew testApi
```

## How to override the base URL for deployed environments
You can override the `baseUrl` using the `karate.baseUrl` system property:
```bash
./gradlew testApis -Dkarate.baseUrl=https://api.podluminary.com
```
Note: When `karate.baseUrl` is overridden, the `KarateTest` runner will still start the local Spring Boot application due to `@SpringBootTest`, but the Karate tests will point to the provided URL.
