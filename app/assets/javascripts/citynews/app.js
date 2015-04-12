CityNews.App = (function() {
  'use-strict';

  function App() {
    this.container = $('#content');
    this.initTemplates();
    this.addEventListeners();
  }

  var fn = App.prototype;

  fn.addEventListeners = function() {
    console.log('app.addEventListeners');
    this.btnMore = $('.leaflet-control-zoom-in');
    this.btnMore.on('click', function(){ alert('more'); });
    // this.container.on('click', '[data-more-content]', $.proxy(this.getArticle('articles/search'), this));
    // this.container.on('click', '[data-more-content]', console.log("click"));
  };

  fn.run = function() {
    console.info('=> Running the CityNews app');

    new CityNews.ShareModal($('[data-menu-share]'));
    new CityNews.Map();
    // this.getArticle('articles/search');
  };



  fn.initTemplates = function(){
    var source = $('#artilces-template').html();
    this.template = Handlebars.compile(source);
  };

  fn.getArticle = function(path){
    var self = this;
    console.log("more content");
    $.get(path, function(){
      console.log("getMoreData");
    })
    .done(function(data){
      console.log(data);
      var temp = self.template(data);
      self.container.append(temp);
      // debugger;
    });
  };

  return App;
}());