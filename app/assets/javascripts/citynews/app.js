CityNews.App = (function() {
  'use-strict';

  function App() {
    // this.initTemplates();
    this.ROUTES = {
      // '#article-template': this.render(this.articlesTemplate, 'articles/search')
    };
  }

  var fn = App.prototype;

  fn.initTemplates = function() {
    this.articlesTemplate = Handlebars.compile($('#artilces-template').html());
  };

  fn.run = function() {
    console.info('=> Running the CityNews app');
    this.articlesDispatcher = new CityNews.ArticlesDispatcher(this.cityMap);

    new CityNews.ShareModal($('[data-menu-share]'));
  };

  fn.loadPage = function(template, path) {
    this.articlesDispatcher.setTemplate(template, path);
  };

  return App;
}());