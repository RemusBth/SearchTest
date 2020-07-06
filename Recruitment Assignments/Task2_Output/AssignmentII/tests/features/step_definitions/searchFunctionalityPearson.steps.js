const { Given, When, Then } = require('cucumber');

const pearsonHomePage = require('../../pages/pearsonHome.page.js');
const pearsonSearchResultsPage = require('../../pages/pearsonSearchResultsPage.js');
const searchedExpectedResult = require('../../files/testData/searchInputInformation.data.js');
const home = new pearsonHomePage();
const search = new pearsonSearchResultsPage();

    Given(/^I open the Pearson website$/, ()=> {
        home.openPearsonHomepage();
    });
  
    When(/^I input a text in the search box and click on search$/,()=>{
        home.startSearch();
    });
  
    When(/^I search for an invalid input (.*)$/, (searchedKeyword) => {
      home.searchInvalidKeyword(searchedKeyword);
    });
  
    Then(/^the search input element is visible$/,()=>{
        home.validateElementVisible();
    });
  
    Then(/^there are maximum 10 displayed results$/,()=>{
      search.validateMaxElementsDisplayed();
    });
  
    Then(/^I check that only the third result displayed is the one expected$/,()=>{
      search.validateExpectedSearchElement();
    });
  
    Then(/^I should get a No Results are found message$/,()=>{
      search.validateNoResultsMessage();
    });
  
    When(/^click on the next button$/,()=>{
      search.clickNext();
    });
  
  