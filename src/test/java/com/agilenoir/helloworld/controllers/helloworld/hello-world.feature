Feature: Hello World API Tests

  Background:
    * url baseUrl
    * print 'baseUrl is ' + baseUrl

  Scenario: GET /hello returns Hello World
    Given path 'hello'
    When method get
    Then status 200
    And match response == 'Hello World'
    And match header Content-Type contains 'text/plain'

  Scenario: GET / returns OK
    Given path '/'
    When method get
    Then status 200
    And match response == 'OK'
    And match header Content-Type contains 'text/plain'

  Scenario: GET /health returns UP
    Given path 'health'
    When method get
    Then status 200
    And match response == { status: 'UP' }

  Scenario: GET /actuator/health returns UP
    Given path 'actuator', 'health'
    When method get
    Then status 200
    And match response == { status: 'UP' }

  Scenario: GET /does-not-exist returns 404
    Given path 'does-not-exist'
    When method get
    Then status 404

  Scenario: POST /hello returns 405
    Given path 'hello'
    When method post
    Then status 405
