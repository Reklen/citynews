CityNews.Map = (function() {
  // The zoom goes from 0 to 12. 12 is the closest.
  var MAX_ZOOM = 12;
  // Greenwich
  var DEFAULT_POSITION = {
    coords: {
      latitude: 51.4778,
      longitude: 0.0015
    }
  };

  function Map(){
    this.titleLayerStr = 'http://{s}.tiles.mapbox.com/v4/rafaelrochasilva.li0cpini/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicmFmYWVscm9jaGFzaWx2YSIsImEiOiJhYWw3VzdFIn0.1fvXksiFzqKFHayxNJxjww';

    this.getUserPosition();
  }

  var fn = Map.prototype;

  fn.addEventListeners = function() {
    this.map.on('click', function(){
      console.log('map clicked');
    });
  };

  fn.initializeMap = function(position) {
    var latitude = position.coords.latitude || DEFAULT_POSITION.coords.latitude;
    var longitude = position.coords.longitude || DEFAULT_POSITION.coords.longitude;

    this.map = L.map('map', {
      attributionControl: false,
      zoomControl: false
    });

    this.map.setView([latitude, longitude], MAX_ZOOM - 3);

    L.tileLayer(this.titleLayerStr, {
      maxZoom: MAX_ZOOM,
    }).addTo(this.map);

    L.control.scale().addTo(this.map);
    L.control.zoom({position: 'topright'}).addTo(this.map);
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

var MyControl = L.Control.extend({
  // options: {
  //   position: 'topright',
  // },

  // onAdd: function (map) {
  //   // create the control container with a particular class name
  //   var container = L.DomUtil.create('div', 'my-custom-control');

  //   // ... initialize other DOM elements, add listeners, etc.

  //   return container;
  // }
  _zoomIn: function(e) {
    alert('zoomIN');
  }
});
