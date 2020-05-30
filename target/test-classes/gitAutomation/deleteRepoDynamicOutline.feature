Feature: Delete all repo in GIT using karate

  Background: Set the baseURL and call the authentication file
    * url baseURL
    * header Authorization = call read('basic-auth.js')

  Scenario: Deleting a repo and verifying the response
      # change the endpoint to GET
      * path '/user/repos'
      * method get
      #verify the status code
      * status 200
      * print response
      * def allRepo = response
      * def myRepoName = $allRepo..name

      #match the response with the name that was generated
      # def filterandfind = function(x){ return x.name == 'R3Gts' }
      #using karate.filter to find out repo
      #* def myRepo = karate.filter(allRepo, filterandfind)
      * print myRepoName
      * def getindex =
    """
    function() {
      var out = 0;
      return out++;
    }
    """
      #once found we will get the report details
      #And retry until myRepoName[*].name == first.id
    * print getindex
      * path '/repos/'+username+'/'+myRepoName
      * method delete
      #verify the status code
      * status 204
      * print response
      #match the response with the name that was generated
      * match response.name == myRepoName[0]

