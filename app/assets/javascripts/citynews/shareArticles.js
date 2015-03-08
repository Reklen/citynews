CityNews.ShareModal = (function() {
  function ShareModal(container) {
    this.container = container;
    this.mainContent = $('#content');
    this.modal = $('[data-trigger-modal]');
    this.modalTemplates = {};

    this.addEventListeners();
  }

  var fn = ShareModal.prototype;

  fn.addEventListeners = function() {
    this.container.on('click', '[data-share]', this.run.bind(this));
  };

  fn.run = function(e) {
    e.preventDefault();
    var link = $(e.currentTarget),
        route = link.data('share');

    this.hideMainContent();

    if (this.modalTemplates[route] === undefined) {
      console.log('getAndDisplayModal: ', route);
      this.getAndShowModal(route);
    } else {
      console.log('showModal: ', route);
      this.showModal(this.modalTemplates[route]);
    }
  };

  fn.showModal = function(template) {
    this.modal.empty();
    this.modal.append(template);
  };

  fn.hideMainContent = function() {
    this.mainContent.hide();
  };

  fn.showMainContant = function() {
    alert('Falha ao abrir a janela, tente Novamente');
    this.mainContent.show();
  };

  fn.getAndShowModal = function(route) {
    var response = $.ajax({
      url: '/' + route + '/new',
      type: 'get'
    });

    response.done(function(data){
      this.modalTemplates[route] = data;
      this.showModal(this.modalTemplates[route]);
    }.bind(this));

    response.fail(function(data) {
      this.hideMainContent();
    }.bind(this));
  };

  return ShareModal;
}());