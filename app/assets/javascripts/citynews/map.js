CityNews.Map = (function() {
  // The zoom goes from 0 to 12. 12 is the closest.
  var MAX_ZOOM = 12;

  function Map(){
    this.titleLayerStr = 'http://{s}.tiles.mapbox.com/v4/rafaelrochasilva.li0cpini/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicmFmYWVscm9jaGFzaWx2YSIsImEiOiJhYWw3VzdFIn0.1fvXksiFzqKFHayxNJxjww';
    this.map = L.map('map');

    this.getUserPosition();
  }

  var fn = Map.prototype;

  fn.initializeMap = function(position) {
    this.map.setView([position.coords.latitude, position.coords.longitude], MAX_ZOOM - 3);
    L.tileLayer(this.titleLayerStr, {maxZoom: MAX_ZOOM}).addTo(this.map);
    L.control.scale().addTo(this.map);
  };

  fn.getUserPosition = function() {
    navigator.geolocation.getCurrentPosition($.proxy(this.initializeMap, this));
  };

  fn.getMapCenter = function() {
    var center = this.map.getCenter();
    return {
      latitude: center.lat,
      longitude: center.lng,
      distance: this.getRadius(center)
    };
  };

  fn.getRadius = function(center) {
    var northEast = this.map.getBounds()._northEast;
        radius = Math.round(center.distanceTo(northEast) / 1000);

    return radius;
  };

  return Map;
})();

  // var MyControl = L.Control.extend({
  //   options: {
  //     position: 'topright',
  //     zoomInText: 'plus'
  //   },

  //   onAdd: function (map) {
  //     // create the control container with a particular class name
  //     var container = L.DomUtil.create('div', 'my-custom-control');

  //     // ... initialize other DOM elements, add listeners, etc.

  //     return container;
  //   }
  // });
