CityNews.App = (function() {
  'use-strict';

  function App() {
    this.container = $('#content');
    this.initTemplates();
    this.addEventListeners();

    this.ROUTES = {
      '#article-template': this.render(this.articlesTemplate)
    };

  }

  var fn = App.prototype;

  fn.addEventListeners = function() {
    this.container.on('click', '[data-trigger-more-content]', $.proxy(this.getArticle, this));
  };

  fn.run = function() {
    console.info('=> Running the CityNews app');

    new CityNews.ShareModal($('[data-menu-share]'));
    new CityNews.Map();
    //this.getArticle('articles/search');
  };

  fn.initTemplates = function(){
    this.articlesTemplate = Handlebars.compile($('#artilces-template').html());
  };

  fn.render = function(template) {
  };

  fn.getArticle = function(){
    var self = this;
    var path = 'articles/search';
    $.get(path, function(){
      console.log("getMoreData in", path);
    })
    .done(function(data){
      self.container.append(self.articlesTemplate(data));
    });
  };

  return App;
}());