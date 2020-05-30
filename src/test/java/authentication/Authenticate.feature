Feature: Implicit Auth

Background:
* url authURL

Scenario: Verify the user details using OAuth2 Implicit grant type

* path 'token'
* form field grant_type = 'password'
* form field username = username
* form field password = password
* form field client_id = appId
* form field client_secret = appSecret
* form field scope = 'api://ati.aws.dev/service'
* method post
* status 200
* print response

* def accessToken = response.access_token



