CityNews.FormBuilder = (function() {
  function FormBuilder() {
    this.$userMenu = $('[data-menu-share]');
    this.$mainContent = $('#content');
    this.$form = $('[data-trigger-form]');
    this.formTemplates = {};

    this.addEventListeners();
  }

  var fn = FormBuilder.prototype;

  fn.addEventListeners = function() {
    this.$userMenu.on('click', '[data-share]', this.render.bind(this));
  };

  fn.render = function(e) {
    e.preventDefault();
    var link = $(e.currentTarget),
        route = link.data('share');

    this.hideMainContent();

    if (this.formTemplates[route] === undefined) {
      this.getForm(route);
    } else {
      this.displayForm(this.formTemplates[route]);
    }
  };

  fn.displayForm = function(template) {
    this.$form.empty();
    this.$form.append(template);
  };

  fn.getForm = function(route) {
    var route_str = '/'+route+'/new';
    $.get(route_str)
    .done($.proxy(this.createForm, this, route))
    .fail($.proxy(this.failForm, this));
  };

  fn.createForm = function(route, data) {
    this.formTemplates[route] = data;
    this.displayForm(this.formTemplates[route]);
  };

  fn.failForm = function() {
    alert("It wasn't possible to process your request, please try again later.");
  };

  fn.hideMainContent = function() {
    this.$mainContent.hide();
  };

  fn.showMainContant = function() {
    alert('Form sent to the server');
    this.$mainContent.show();
  };

  return FormBuilder;
}());