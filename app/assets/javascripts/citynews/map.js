CityNews.Map = (function() {
  function Map(){
    this.map = L.map('map');
    this.setMap(51.505, -0.09, 13);
  }

  var fn = Map.prototype;

  fn.setMap = function(latitude, longitude, zoomLevel) {
    console.log("setmap");
    this.map.setView([latitude, longitude], zoomLevel);
    this.setTileLayer();
  };

  fn.setTileLayer = function() {
    this.tileLayer = L.tileLayer('http://{s}.tiles.mapbox.com/v4/rafaelrochasilva.li0cpini/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicmFmYWVscm9jaGFzaWx2YSIsImEiOiJhYWw3VzdFIn0.1fvXksiFzqKFHayxNJxjww',
    {
      maxZoom: 18
    }).addTo(this.map);
  };

  return Map;
})();
