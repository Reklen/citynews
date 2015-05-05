CityNews.App = (function() {
  'use-strict';

  function App() {
    var currentPath = window.location.pathname;

    this.$mainMenu = $('[data-main-menu]');
    this.templates = this.initTemplates();
    this.contentLoader = new CityNews.ContentLoader(currentPath, this.templates[currentPath]);
    this.underlineNewRoute(currentPath);

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
      '/articles': Handlebars.compile($('#artilces-template').html()),
      '/events': Handlebars.compile($('#artilces-template').html())
    };
  };

  fn.displayRouteContent = function(e) {
    e.preventDefault();
    var link = $(e.currentTarget),
        path = link.data('menu-route');

    this.underlineNewRoute(path);
    this.contentLoader.run(path, this.templates[path]);
  };

  fn.underlineNewRoute = function(path) {
    var currentDataMenu = "[data-menu-route='"+path+"']",
        link = this.$mainMenu.find(currentDataMenu);

    if(link) {
      window.history.pushState(path, "Title", path);
      this.$mainMenu.find('a').css('text-decoration', 'none');
      link.css('text-decoration', 'underline');
    }
  };

  return App;
}());