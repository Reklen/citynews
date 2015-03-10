$(function() {
  var app = new CityNews.App();
  app.run();

  $(document).on('page:load', function() {
    app.run();
  });
});