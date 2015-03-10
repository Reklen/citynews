CityNews.App = (function() {
  'use-strict';

  function App() {
  }

  var fn = App.prototype;

  fn.run = function() {
    console.info('=> Running the CityNews app');

    new CityNews.ShareModal($('[data-menu-share]'));
  };

  return App;
}());