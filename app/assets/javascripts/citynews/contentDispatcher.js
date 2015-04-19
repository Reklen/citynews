CityNews.ContentDispatcher = (function() {
  function ContentDispatcher() {
    this.cityMap = new CityNews.Map(this);
    this.path = 'articles/search';//remove in the future

    this.$container = $('#content');
    this.initTemplates();//remove in the future
  }

  var fn = ContentDispatcher.prototype;

  // Remove in the future
  fn.initTemplates = function(){
    this.template = Handlebars.compile($('#artilces-template').html());
  };

  fn.run = function(template, path) {
    this.template = template;
    this.path = path;
    this.getContent();
  };

  fn.getContent = function() {
    var cityMapCenter = this.cityMap.getMapCenter();
        cityMapCenter_str = JSON.stringify(cityMapCenter);

    if(this.mapCenter != cityMapCenter_str) {
      this.mapCenter = cityMapCenter_str;

      $.get(this.path, cityMapCenter)
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
    this.$container.append(this.template(data));
    this.$container.find('[data-title]').text(distance+' km');
  };

  return ContentDispatcher;
})();