Feature: Validate on the functionality of the api
  Background:
    Given url host

  Scenario: Verify user can login successfully
    Given path "/login"
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    * def body = read("classpath://json/login.json")
    And request body
    When method post
    Then status 200
    And print response

  Scenario: Verify user didn't get data and unsuccessful result
    Given path "/users/"+invalidID
    When method get
    Then status 404

  Scenario: Verify user can update the data
    Given path "/users/"+id
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    * def body = read("classpath://json/update.json")
    And request body
    When method put
    Then status 200
    And print response

  Scenario: Verify user can delete the data
    Given path "/users/"+id
    When method delete
    Then status 204