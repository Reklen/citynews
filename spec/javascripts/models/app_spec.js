describe('CityNews.App', function() {
  'use strict';
  var app;

  beforeEach(function(){
    app = new CityNews.App();
  });

  it('returns a instance of App', function() {
    expect(app).toBeDefined();
  });
});