CityNews.App = (function() {
  'use-strict';

  function App() {
    var currentPath = 'articles', //window.location.pathname;
        currentDataMenu = "[data-menu-route='"+currentPath+"']";

    this.$mainMenu = $('[data-main-menu]');
    this.setNewRoute(currentPath, this.$mainMenu.find(currentDataMenu));

    this.templates = this.initTemplates();
    this.contentDispatcher = new CityNews.ContentDispatcher(currentPath, this.templates[currentPath]);

    new CityNews.FormBuilder();
    this.addEventListeners();
  }

  var fn = App.prototype;

  fn.addEventListeners = function() {
    this.$mainMenu.on('click', '[data-menu-route]', this.displayRouteContent.bind(this));
  };

  fn.initTemplates = function() {
    return {
      '/': Handlebars.compile($('#artilces-template').html()),
      'articles': Handlebars.compile($('#artilces-template').html()),
      'events': Handlebars.compile($('#artilces-template').html())
    };
  };

  fn.displayRouteContent = function(e) {
    e.preventDefault();
    var link = $(e.currentTarget),
        path = link.data('menu-route');

    this.setNewRoute(path, link);
    this.contentDispatcher.run(path, this.templates[path]);
  };

  fn.setNewRoute = function(path, link) {
    if(link) {
      window.history.pushState(path, "Title", path);
      this.$mainMenu.find('a').css('text-decoration', 'none');
      link.css('text-decoration', 'underline');
    }
  };

  return App;
}());