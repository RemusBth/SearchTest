class pearsonSearchResultsLocators {
  constructor() {
    this.previousBtn = '.pagination__btn.hasArrow.arrowLeft';
    this.nextBtn = '.pagination__btn.hasArrow.arrowRight';
    this.searchResultsParent = '.searchBanner';
    this.noResultsTextbox = '#st-no-results';
    this.maxNumberOfElementsDisplayed = '.st-results-container p strong:nth-child(2)';
    this.searchResultExpected = 'article.productItem.test:nth-of-type(3) > a.productItem__name';
  }
}

module.exports = pearsonSearchResultsLocators;
