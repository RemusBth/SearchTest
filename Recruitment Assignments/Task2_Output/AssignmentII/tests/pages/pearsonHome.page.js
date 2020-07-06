const NativePage = require('./native.page.js');
const pearsonHomePageData = require('../files/testData/searchInputInformation.data.js');

class pearsonHomePage extends NativePage {

  get pearsonHomePageElement() {
    return this.getPage('pearsonHome.locators');
  }

  openPearsonHomepage() {
    browser.url(pearsonHomePageData['url']);
    //browser.maximizeWindow();
  }

  startSearch() {

    // const cookiesBtn = $(this.pearsonHomePageElement.cookiesOkBtn);
    // if(cookiesBtn.isClickable){
    //   cookiesBtn.click();
    // }

    const searchField = $(this.pearsonHomePageElement.searchField);
    searchField.click();
    searchField.setValue(pearsonHomePageData['searchedExpectedResult']);

    const searchBtn = $(this.pearsonHomePageElement.searchBtn);
    searchBtn.click();

  }

  searchInvalidKeyword(searchKeyword) {
    // const cookiesBtn = $(this.pearsonHomePageElement.cookiesOkBtn)
    // if(cookiesBtn.isClickable){ 
    //   cookiesBtn.click();
    // }
    const searchFieldText = $(this.pearsonHomePageElement.searchField);
    const searchBtn = $(this.pearsonHomePageElement.searchBtn);
    
    searchFieldText.click();
    searchFieldText.setValue(pearsonHomePageData[searchKeyword]);
    
    searchBtn.click();
  }
  
  validateElementVisible(){
    const searchElementBtn = $(this.pearsonHomePageElement.searchBtn);
    const searchElementText = $(this.pearsonHomePageElement.searchField);
    expect(searchElementBtn).toBeClickable();
    expect(searchElementText).toBeVisible();
  }
}

module.exports = pearsonHomePage;
