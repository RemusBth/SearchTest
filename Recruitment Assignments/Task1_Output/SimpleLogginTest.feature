Feature: Login into Application

Scenario Outline: Simple test validating login
Given Initialize the browser with "browser" and navigate to the login page
When User enters <username> and <password> and clicks login
Then Verify that user is <logged> in 
And close browsers

Examples:
|username			|password			|logged	|
|correctUsername	|correctPassword	|true	|
|incorrectUsername	|correctPassword	|false	|
|correctUsername	|incorrectPassword	|false	|
|incorrectUsername	|incorrectPassword	|false	|
#last step is just to cover any possible faults, if the ones before are ok, this should also be ok.