Feature: the karate-config.js can perform 'singleton' style one-time init of auth
     instead of re-doing it for every feature in a test-suite, even for multi-threaded / parallel runs

  Background: 
    * url atiawsURL
    # refer to karate-config.js to see how these were initialized
    * def time = authInfo.authTime
    * def token = authInfo.authToken
    * print token
    * print time
    # we now have  information to set up auth / headers for all scenarios
    #* cookie time = time
    #* configure headers = read('classpath:headers.js')
		* header Authorization = 'Bearer ' + token
		
  Scenario: Create all employer details
    Given def query = read('createEmployerQuery.graphql')
    Given def variables = read('createEmployerVariable.graphql')
    
    #And def variables = { name: 'Charmander' }
    And request { query: '#(query)', variables: '#(variables)' }
    #And request { query: '#(query)' } 
    When method post
    * print response
    Then status 200
