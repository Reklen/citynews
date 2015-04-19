CityNews.App = (function() {
  'use-strict';

  function App() {
    // this.initTemplates();
    this.ROUTES = {
      // '#article-template': this.contentDispatcher.setTemplate(template, path);
    };
  }

  var fn = App.prototype;

  fn.initTemplates = function() {
    this.articlesTemplate = Handlebars.compile($('#artilces-template').html());
  };

  fn.run = function() {
    console.info('=> Running the CityNews app');
    this.contentDispatcher = new CityNews.ContentDispatcher(this.cityMap);

    new CityNews.ShareModal($('[data-menu-share]'));
  };

  return App;
}());