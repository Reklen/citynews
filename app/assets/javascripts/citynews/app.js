CityNews.App = (function() {
  'use-strict';

  function App() {
    this.$mainMenu = $('[data-main-menu]');
    new CityNews.ShareModal($('[data-menu-share]'));

    this.templates = this.initTemplates();

    this.contentDispatcher = new CityNews.ContentDispatcher('articles', this.templates['articles']);
    this.addEventListeners();
  }

  var fn = App.prototype;

  fn.addEventListeners = function() {
    this.$mainMenu.on('click', '[data-menu-route]', this.displayRouteContent.bind(this));
  };

  fn.initTemplates = function() {
    return {
      'articles': Handlebars.compile($('#artilces-template').html())
    };
  };

  fn.displayRouteContent = function(e) {
    var link = $(e.currentTarget),
        path = link.data('menu-route');

    console.log("CityNews is running the route: ", path);
    //add in the header a new route
    // this.contentDispatcher.run(path, this.templates[path]);
  };

  return App;
}());