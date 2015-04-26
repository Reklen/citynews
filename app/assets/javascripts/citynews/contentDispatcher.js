CityNews.ContentDispatcher = (function() {
  function ContentDispatcher(path, template) {
    this.path = path;
    this.currentTemplate = template;
    this.$container = $('#content');

    this.cityMap = new CityNews.Map(this);
  }

  var fn = ContentDispatcher.prototype;

  fn.run = function(path, template) {
    this.path = path;
    this.currentTemplate = template;

    this.getContent();
  };

  fn.getContent = function() {
    var requestedRoute = '/'+ this.path + '/search',
        cityMapCenter = this.cityMap.getMapCenter(),
        cityMapCenter_str = JSON.stringify(cityMapCenter);

    if(this.mapCenter != cityMapCenter_str) {
      this.mapCenter = cityMapCenter_str;

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
    this.$container.find('[data-contentDispatcher-container]').remove();
  };

  fn.appendContent = function(distance, data) {
    this.$container.append(this.currentTemplate(data));
    this.$container.find('[data-title]').text(distance+' km');
  };

  return ContentDispatcher;
})();