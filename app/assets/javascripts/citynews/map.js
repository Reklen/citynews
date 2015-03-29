CityNews.Map = (function() {
  function Map(){
    this.titleLayerStr = 'http://{s}.tiles.mapbox.com/v4/rafaelrochasilva.li0cpini/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicmFmYWVscm9jaGFzaWx2YSIsImEiOiJhYWw3VzdFIn0.1fvXksiFzqKFHayxNJxjww';
    this.map = L.map('map');
    this.getUserPosition();
  }

  var fn = Map.prototype;

  fn.setMap = function(position) {
    var zoomLevel = 13;
    this.map.setView([position.coords.latitude, position.coords.longitude], zoomLevel);
    this.setTileLayer();
  };

  fn.setTileLayer = function() {
    this.tileLayer = L.tileLayer(this.titleLayerStr, {maxZoom: 18})
                      .addTo(this.map);
  };

  fn.getUserPosition = function(){
    navigator.geolocation.getCurrentPosition($.proxy(this.setMap, this));
  };

  return Map;
})();
