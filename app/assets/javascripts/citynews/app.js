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
    this.map = new CityNews.Map(this);
  };

  fn.initTemplates = function(){
    this.articlesTemplate = Handlebars.compile($('#artilces-template').html());
  };

  fn.render = function(template, path, zoom) {

  };

  fn.renderArticle = function(mapCenter){
    var self = this,
        path = 'articles/search';

    $.get(path, mapCenter)
    .done(function(data){
      self.container.find('[data-articles-template]').remove();
      self.container.append(self.articlesTemplate(data));
    });
  };

  return App;
}());