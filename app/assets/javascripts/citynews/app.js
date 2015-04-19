CityNews.App = (function() {
  'use-strict';

  function App() {
    this.container = $('#content');
    this.initTemplates();
    this.addEventListeners();

    this.ROUTES = {
      '#article-template': this.render(this.articlesTemplate, 'articles/search')
    };
  }

  var fn = App.prototype;

  fn.addEventListeners = function() {
    this.container.on('click', '[data-trigger-refresh]', $.proxy(this.getArticle, this));
  };

  fn.run = function() {
    console.info('=> Running the CityNews app');

    new CityNews.ShareModal($('[data-menu-share]'));
    this.cityMap = new CityNews.Map(this);
  };

  fn.initTemplates = function(){
    this.articlesTemplate = Handlebars.compile($('#artilces-template').html());
  };

  fn.render = function(template, path, zoom) {
  };

  fn.getArticles = function() {
    var path = 'articles/search',
        currentMapCenter = this.cityMap.getMapCenter();
        currentMapCenter_str = JSON.stringify(currentMapCenter);

    if(this.mapCenter != currentMapCenter_str) {
      this.mapCenter = currentMapCenter_str;

      $.get(path, currentMapCenter)
      .done($.proxy(this.renderArticles, this));
    }
  };

  fn.renderArticles = function(data) {
    this.container.find('[data-articles-template]').remove();
    this.container.append(this.articlesTemplate(data));
    this.cityMap.renderPoints(data);
  };

  return App;
}());