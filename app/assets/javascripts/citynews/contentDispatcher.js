CityNews.ContentDispatcher = (function() {
  function ContentDispatcher(path, template) {
    this.path = path;
    this.currentTemplate = template;

    this.cityMap = new CityNews.Map(this);

    this.$container = $('#content');
  }

  var fn = ContentDispatcher.prototype;

  fn.run = function(path, template) {
    this.path = path;
    this.currentTemplate = template;

    this.getContent();
  };

  fn.getContent = function() {
    var requestedRoute = this.path + '/search',
        cityMapCenter = this.cityMap.getMapCenter(),
        cityMapCenter_str = JSON.stringify(cityMapCenter);

    if(this.mapCenter != cityMapCenter_str) {
      this.mapCenter = cityMapCenter_str;

      $.get(requestedRoute, cityMapCenter)
      .done($.proxy(this.renderContainer, this, cityMapCenter.distance.toString()));
    }
  };

  fn.renderContainer = function(distance, data) {
    this.removeContainer();
    this.appendContainer(distance, data);

    this.cityMap.renderPoints(data);
  };

  fn.removeContainer= function() {
    this.$container.find('[data-contentDispatcher-container]').remove();
  };

  fn.appendContainer = function(distance, data) {
    this.$container.append(this.currentTemplate(data));
    this.$container.find('[data-title]').text(distance+' km');
  };

  return ContentDispatcher;
})();