Handlebars.registerHelper("prettifyDate", function(created_at) {
  return new Date(created_at).toLocaleDateString();
});