Feature: Creating a repo in GIT using karate

  Background: Set the baseURL and call the authentication file
    * url baseURL
    * header Authorization = call read('basic-auth.js')

    Scenario: creating a repo and verifying the response
      # change the endpoint to GET
      * path '/user/repos'
      * method get
      #verify the status code
      * status 200
      * print response



