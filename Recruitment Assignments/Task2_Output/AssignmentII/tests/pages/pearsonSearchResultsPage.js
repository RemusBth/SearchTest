const NativePage = require('./native.page.js');
const pearsonSearchResultsPageData = require('../files/testData/searchInputInformation.data.js');

class pearsonSearchResultsPage extends NativePage {

  get pearsonSearchResultsPageElement() {
    return this.getPage('pearsonSearchResults.locators');
  }

  clickNext() {
    const searchField = $(this.pearsonSearchResultsPageElement.nextBtn);
    searchField.click();
  }

  validateNoResultsMessage(){
    const noResultsMessage = $(this.pearsonSearchResultsPageElement.noResultsTextbox);
    expect(noResultsMessage).toHaveText('We\'re sorry, we didn\'t find anything that matched your search.');
  }

  validateBtnDisabled(){
    const backBtn = $(this.pearsonSearchResultsPageElement.previousBtn);
    expect(backBtn.getProperty('disabled')).toBeDisabled();
  }

  validateBtnEnabled(){
    const backBtn = $(this.pearsonSearchResultsPageElement.previousBtn);
    expect(backBtn.getProperty('disabled')).toBeEnabled();
  }

  validateMaxElementsDisplayed(){
    const searchedResults = $$(this.pearsonSearchResultsPageElement.searchResultsParent);
    expect(searchedResults).toHaveChildren({ lte: 'limitOfDisplayedElements' });  
  }
  validateExpectedSearchElement(){
    const resultElementToCheck = $(this.pearsonSearchResultsPageElement.searchResultExpected);
        
    //check text in article
    expect(resultElementToCheck).toHaveTextContaining(pearsonSearchResultsPageData['expectedResult']);
  }

}

module.exports = pearsonSearchResultsPage;
