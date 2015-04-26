CityNews.App = (function() {
  'use-strict';

  function App() {
<<<<<<< HEAD
    var currentPath = 'articles', //window.location.pathname;
        currentDataMenu = "[data-menu-route='"+currentPath+"']";

    this.$mainMenu = $('[data-main-menu]');
    this.setNewRoute(currentPath, this.$mainMenu.find(currentDataMenu));
=======
    this.$mainMenu = $('[data-main-menu]');
    new CityNews.ShareModal($('[data-menu-share]'));
>>>>>>> parent of 75c8fd5... Add a routes handle with JS

    this.templates = this.initTemplates();

<<<<<<< HEAD
    new CityNews.FormBuilder();
=======
    this.contentDispatcher = new CityNews.ContentDispatcher('articles', this.templates['articles']);
>>>>>>> parent of 75c8fd5... Add a routes handle with JS
    this.addEventListeners();
  }

  var fn = App.prototype;

  fn.addEventListeners = function() {
    this.$mainMenu.on('click', '[data-menu-route]', this.displayRouteContent.bind(this));
  };

  fn.initTemplates = function() {
    return {
<<<<<<< HEAD
      '/': Handlebars.compile($('#artilces-template').html()),
      'articles': Handlebars.compile($('#artilces-template').html()),
      'events': Handlebars.compile($('#artilces-template').html())
=======
      'articles': Handlebars.compile($('#artilces-template').html())
>>>>>>> parent of 75c8fd5... Add a routes handle with JS
    };
  };

  fn.displayRouteContent = function(e) {
    var link = $(e.currentTarget),
        path = link.data('menu-route');

<<<<<<< HEAD
    this.setNewRoute(path, link);
    this.contentDispatcher.run(path, this.templates[path]);
  };

  fn.setNewRoute = function(path, link) {
    if(link) {
      window.history.pushState(path, "Title", path);
      this.$mainMenu.find('a').css('text-decoration', 'none');
      link.css('text-decoration', 'underline');
    }
=======
    console.log("CityNews is running the route: ", path);
    //add in the header a new route
    // this.contentDispatcher.run(path, this.templates[path]);
>>>>>>> parent of 75c8fd5... Add a routes handle with JS
  };

  return App;
}());