CityNews.Map = (function() {
  // The zoom goes from 0 to 12. 12 is the closest.
  var MAX_ZOOM = 12;
  var POSITION = { coords: {latitude: 0, longitude: 0}};

  function Map(app){
    this.app = app;
    this.titleLayerStr = 'http://{s}.tiles.mapbox.com/v4/rafaelrochasilva.li0cpini/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicmFmYWVscm9jaGFzaWx2YSIsImEiOiJhYWw3VzdFIn0.1fvXksiFzqKFHayxNJxjww';
    this.getUserPosition();
    this.initializeMap();
    this.addEventListeners();
  }

  var fn = Map.prototype;

  fn.addEventListeners = function() {
    var self = this;
    this.map.on('zoomstart', function(){
      self.mapIsLoaded();
    });
    this.map.on('dragend', function() {
      self.mapIsLoaded();
    });
  };

  fn.initMap = function() {
    this.map = L.map('map', {
      attributionControl: false,
      zoomControl: false
    });

    this.initializeLayer();
    this.initializeControl();

    this.render(POSITION, 1);
  };

  fn.initLayer = function() {
    L.tileLayer(this.titleLayerStr, {
      maxZoom: MAX_ZOOM,
    }).addTo(this.map);
  };

  fn.initControl = function() {
    L.control.scale().addTo(this.map);
    L.control.zoom({position: 'topright'}).addTo(this.map);
  };

  fn.getUserPosition = function() {
    var self = this;
    navigator.geolocation.getCurrentPosition(function(position) {
      self.render(position, 10);
    });
  };

  fn.render = function(position, zoom) {
    this.map.setView([position.coords.latitude, position.coords.longitude], zoom);
    this.app.renderArticle(this.getMapCenter());
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
