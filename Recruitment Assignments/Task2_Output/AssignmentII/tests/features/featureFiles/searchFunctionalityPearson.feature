Feature: Check the search functionality for pearson.com
    As stated by the requirements, the search element on pearson.com,
    should respect the following rules:
        • Search input should be visible on main page.
        • First page with searching result should have at most 10 elements.
        • Clicking on Next button should display next page with 10 more result.
        • Third searched element should redirect to the proper article.


    Background:
        
        Given I open the Pearson website

    
    @Test
    Scenario: The search element is visible on the main page
        
        Then the search input element is visible


    @Test
    Scenario: Checking for maximum 10 displayed results when searching
       
        When I input a text in the search box and click on search
        Then there are maximum 10 displayed results        


    @Test
    Scenario: Checking the second search list for maximum 10 displayed results when searching
       
        When I input a text in the search box and click on search
        And click on the next button
        Then there are maximum 10 displayed results

    @Test
    Scenario: Checking the third search result displayed is the one expected
        
        When I input a text in the search box and click on search
        Then I check that only the third result displayed is the one expected


    @Test
    Scenario Outline: Invalid special characters and search length to check the limitations of the search bar

        When I search for an invalid input <search keyword>
        Then I should get a No Results are found message

    Examples:
      | search keyword          |
      | onlySpecialCharacters   |
      | invalidLengthOfInputData|