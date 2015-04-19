CityNews.ArticlesDispatcher = (function() {
  function ArticlesDispatcher() {
    this.cityMap = new CityNews.Map(this);
    this.path = 'articles/search';//remove in the future

    this.$container = $('#content');
    this.initTemplates();//remove in the future
  }

  var fn = ArticlesDispatcher.prototype;

  // Remove in the future
  fn.initTemplates = function(){
    this.template = Handlebars.compile($('#artilces-template').html());
  };

  fn.setTemplate = function(template, path) {
    this.template = template;
    this.path = path;
    this.getArticles();
  };

  fn.getArticles = function() {
    var cityMapCenter = this.cityMap.getMapCenter();
        cityMapCenter_str = JSON.stringify(cityMapCenter);

    if(this.mapCenter != cityMapCenter_str) {
      this.mapCenter = cityMapCenter_str;

      $.get(this.path, cityMapCenter)
      .done($.proxy(this.renderArticles, this, cityMapCenter.distance.toString()));
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
    this.$container.append(this.template(data));
  };

  return ArticlesDispatcher;
})();