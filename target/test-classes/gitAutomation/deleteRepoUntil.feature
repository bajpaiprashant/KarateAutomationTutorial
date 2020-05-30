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
      * def allRepo = response
      #match the response with the name that was generated
      * def filterandfind = function(x){ return x.name == 'R3Gts' }
      #using karate.filter to find out repo
      * def myRepo = karate.filter(allRepo, filterandfind)
      * print myRepo
      * def myRepoName = $myRepo..name
      * print myRepoName
      #once found we will get the report details
      * path '/repos/'+username+'/'+myRepoName[0]
      * method get
      #verify the status code
      * status 200
      * print response
      #match the response with the name that was generated
      * match response.name == myRepoName[0]


