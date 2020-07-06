Feature: Check the loggin on the Pearson English Portal
	Only by using the correct username and password access shall be granted onn the portal
	
Background: 
Given access to the loggin page "page" using the browser "browser"
  
  #successful after the first try
  @Test
  Scenario: Access is granted on the first try
  When I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"
  
  #unsuccessful after the first try, check error message
  @Test
  Scenario: Access is NOT granted when entering a bad username
  When I enter username "incorrectUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "denied"
  
  @Test
  Scenario: Access is NOT granted when entering a bad password
  When I enter username "correctUser" and password "incorrectPassword" click the loggin button "one" times
  Then Access to the portal is "denied"
  
  #successful after the second try
  @Test
  Scenario: Access is granted after the second try, after a bad username
  When I enter username "incorrectUser" and password "correctPassword" click the loggin button "one" times
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"
  
  @Test
  Scenario: Access is granted after the second try, after a bad password
  When I enter username "correctUser" and password "incorrectPassword" click the loggin button "one" times
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"
  
  #successful after the maximum try limit -1
  @Test
  Scenario: Access is granted after the specified maximum number of bad loggin minus one attempts with a bad username
  When I enter username "incorrectUser" and password "correctPassword" click the loggin button "maxNumberOfBadLoggin-1" times
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"
      
  @Test
  Scenario: Access is granted after the specified maximum number of bad loggin minus one attempts with a bad password
  When I enter username "correctUser" and password "incorrectPassword" click the loggin button "maxNumberOfBadPassword-1" times
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"
  
    
  #successful after the maximum try limit  
  @Test  
  Scenario: Access is NOT granted after the specified maximum number of bad loggin with a bad username
  When I enter username "incorrectUser" and password "correctPassword" click the loggin button "maxNumberOfBadLoggin" times
  Then Access to the portal is restricted for the specified limitation as IP address
  
  
  @Test  
  Scenario: Access is NOT granted after the the specified maximum number of bad loggin with a bad password
  When I enter username "correctUser" and password "incorrectPassword" click the loggin button "maxNumberOfBadPassword" times
  Then Access to the portal is restricted for the specified "username"
  
  
  #Scenarios for hacking
  #if there is a time limit, not respecting it
  @Test
  Scenario: Access is NOT granted after the specified maximum number of bad loggin with a bad username
   by deleting the cookies and NOT waiting for the time limit
  When I enter username "incorrectUser" and password "correctPassword" click the loggin button "maxNumberOfBadLoggin" times
  And clear the cookies, open browser "incognitoMode" and go on the loggin page
  Then Access to the portal is restricted for the specified limitation as IP address
  
  #if there is a time limit after respecting it
  @Test
  Scenario: Access is granted after the specified maximum number of bad loggin with a bad username 
  by deleting the cookies and waiting for the time limit
  When I enter username "incorrectUser" and password "correctPassword" click the loggin button "maxNumberOfBadLoggin" times
  And clear the cookies, open browser "NormalMode" and go on the loggin page
  And I wait for the specific time limit "timeLimitForUserAccess"
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"

  #if there is a time limit for password, and user is not blocked , by not respecting it
  @Test
  Scenario: Access is granted after the specified maximum number of bad loggin with a bad password
  by waiting for the time limit
  When I enter username "correctUser" and password "incorrectPassword" click the loggin button "maxNumberOfBadPassword" times
  And wait for the "timeLimitForIncorrectPassword" to pass
  And clear the cookies, open browser "NormalMode" and go on the loggin page
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is "granted"
  
    #if there is no time limit for password, and user is blocked
  @Test
  Scenario: Access is NOTgranted after the specified maximum number of bad loggin with a bad password
  by waiting for the time limit
  When I enter username "correctUser" and password "incorrectPassword" click the loggin button "maxNumberOfBadPassword" times
  And clear the cookies, open browser "incognitoMode" and go on the loggin page
  And I enter username "correctUser" and password "correctPassword" click the loggin button "one" times
  Then Access to the portal is restricted for the specified "username"
  
  
  