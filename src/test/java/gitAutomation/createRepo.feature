Feature: Creating a repo in GIT using karate

  Background: Set the baseURL and call the authentication file
    * url baseURL
    * header Authorization = call read('basic-auth.js')

    Scenario: creating a repo and verifying the response
      * path '/user/repos'
      #Change the repo_name and any other fields
      * def createRepoBody = read('createRepo.json')
      #Get the data from the config function in the JS file
      * def name = randomName
      #Setting the name for the request
      * set createRepoBody.name = name
      #Add the final body in the request
      And request (createRepoBody)
      * method post
      #verify the status code
      * status 201
      * print response
      #match the response with the name that was generated
      * def repoName = response.name
      * print repoName
      * match repoName == name
      # change the endpoint to GET
      * path '/repos/'+username+'/'+repoName
      * method get
      #verify the status code
      * status 200
      * print response
      #match the response with the name that was generated
      * match response.name == name
      #match type and data
      * match response.private == false



