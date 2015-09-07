CityNews.ContentLoader = (function() {
  function ContentLoader(template) {
    this.currentTemplate = template;
    this.$container = $('#content');

    this.cityMap = new CityNews.Map(this);
  }

  var fn = ContentLoader.prototype;

  fn.run = function(template) {
    this.currentTemplate = template;
    this.getContent();
  };

  fn.getCurrentRoute = function() {
    var location;
    if (window.location.pathname === "/") {
      location = 'search';
    }else {
      location = '/search';
    }
    return window.location.href + location;
  };

  fn.getContent = function() {
    var requestedRoute = this.getCurrentRoute(),
        cityMapCenter = this.cityMap.getMapCenter(),
        currentContent= requestedRoute + JSON.stringify(cityMapCenter);

    if(this.oldContent != currentContent) {
      this.oldContent = currentContent;

      $.get(requestedRoute, cityMapCenter)
      .done($.proxy(this.render, this, cityMapCenter.distance.toString()))
      .fail($.proxy(this.fail, this, requestedRoute));
    }
  };

  fn.render = function(distance, data) {
    this.removeContent();
    this.appendContent(distance, data);

    this.cityMap.renderPoints(data);
  };

  fn.fail = function(request, data) {
    console.log(request, data);
  };

  fn.removeContent= function() {
    this.$container.find('[data-contentLoader-container]').remove();
  };

  fn.appendContent = function(distance, data) {
    this.$container.append(this.currentTemplate(data));
    this.$container.find('[data-title]').text(distance+' km');
  };

  return ContentLoader;
})();
