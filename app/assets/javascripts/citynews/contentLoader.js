CityNews.ContentLoader = (function() {
  function ContentLoader(path, template) {
    this.path = path;
    this.currentTemplate = template;
    this.$container = $('#content');

    this.cityMap = new CityNews.Map(this);
  }

  var fn = ContentLoader.prototype;

  fn.run = function(path, template) {
    this.path = path;
    this.currentTemplate = template;
    this.getContent();
  };

  fn.getContent = function() {
    var requestedRoute = window.location.pathname + '/search',
        cityMapCenter = this.cityMap.getMapCenter(),
        currentContent= requestedRoute + JSON.stringify(cityMapCenter);

    if(this.oldContent != currentContent) {
      this.oldContent = currentContent;

      $.get(requestedRoute, cityMapCenter)
      .done($.proxy(this.render, this, cityMapCenter.distance.toString()))
      .fail($.proxy(this.fail, this));
    }
  };

  fn.render = function(distance, data) {
    this.removeContent();
    this.appendContent(distance, data);

    this.cityMap.renderPoints(data);
  };

  fn.fail = function() {
    alert('A problem has happened, please reload the page');
  };

  fn.removeContent= function() {
    this.$container.find('[data-contentLoader-container]').remove();
  };

  fn.appendContent = function(distance, data) {
    debugger;
    this.$container.append(this.currentTemplate(data));
    this.$container.find('[data-title]').text(distance+' km');
  };

  return ContentLoader;
})();