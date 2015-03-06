CityNews.ShareModal = (function() {
  function ShareModal(container) {
    this.container = container;
    this.addEventListeners();
  }

  var fn = ShareModal.prototype;

  fn.addEventListeners = function() {
    this.container.on('click', '[data-share-articles]', this.showModal);
  };

  fn.showModal = function(e) {
    // e.preventDefault();
    alert("showModal");
  };

  return ShareModal;
}());