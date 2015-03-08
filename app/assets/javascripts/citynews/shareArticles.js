CityNews.ShareModal = (function() {
  function ShareModal(container) {
    this.container = container;
    this.mainContent = $('#content');
    this.modal = $('[data-trigger-modal]');
    this.addEventListeners();
  }

  var fn = ShareModal.prototype;

  fn.addEventListeners = function() {
    this.container.on('click', '[data-share]', this.showModal.bind(this));
  };

  fn.showModal = function(e) {
    e.preventDefault();
    var link = $(e.currentTarget),
        route = link.data('share');

    this.hideMainContent();
    this.displayModal(route);

  };

  fn.hideMainContent = function() {
    this.mainContent.hide();
  };

  fn.showMainContant = function() {
    alert('Falha ao abrir a janela, tente Novamente');
    this.mainContent.show();
  };

  fn.displayModal = function(route) {
    var response = $.ajax({
      url: '/' + route + '/new',
      type: 'get'
    });

    response.done(function(data){
      this.modal.append(data);
    }.bind(this));

    response.error(function(data) {
      console.log('Error');
      this.hideMainContent();
    });

  };

  return ShareModal;
}());