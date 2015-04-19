CityNews.ArticlesDispatcher = (function() {
  function ArticlesDispatcher() {
    this.cityMap = new CityNews.Map(this);

    this.$container = $('#content');
    this.initTemplates();//remove in the future
  }

  var fn = ArticlesDispatcher.prototype;

  // Remove in the future
  fn.initTemplates = function(){
    this.articlesTemplate = Handlebars.compile($('#artilces-template').html());
  };

  fn.setTemplate = function(template, path) {
    this.template = template;
    this.path = path;
  };

  fn.getArticles = function() {
    var path = 'articles/search',
        currentMapCenter = this.cityMap.getMapCenter();
        currentMapCenter_str = JSON.stringify(currentMapCenter);

    if(this.mapCenter != currentMapCenter_str) {
      this.mapCenter = currentMapCenter_str;

      $.get(path, currentMapCenter)
      .done($.proxy(this.renderArticles, this, currentMapCenter.distance.toString()));
    }
  };

  fn.renderArticles = function(distance, data) {
    this.removeOldArticles();
    this.appendNewArticles(distance, data);

    this.cityMap.renderPoints(data);
  };

  fn.removeOldArticles = function() {
    this.$container.find('[data-articles-template]').remove();
  };

  fn.appendNewArticles = function(distance, data) {
    this.$container.find('[data-title]').text(distance+' km');
    this.$container.append(this.articlesTemplate(data));
  };

  return ArticlesDispatcher;
})();