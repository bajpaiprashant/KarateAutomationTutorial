Feature: Creating a repo in GIT using karate

  Background: Set the baseURL and call the authentication file
    * url baseURL
    * header Authorization = call read('basic-auth.js')

    Scenario: creating a repo and verifying the response
      * path '/user/repos'
      #Change the repo_name and any other fields
      * def createRepoBody = read('createRepo.json')
      * def name = randomName
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
      * path '/repos/'+username+'/'+repoName


      #match type and data
      * match response.private == false


    Scenario: Getting a repo details and verifying the response
      * path '/repos/'+username+'/'+repoName
      * header Authorization = call read('basic-auth.js')
      * method get
        #verify the status code
      * status 200
      * print response
        #match the response with the name that was generated
      * match response.name == name
        #match type and data
      * match response.private == false


