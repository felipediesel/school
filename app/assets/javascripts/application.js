//= require init
//= require_directory ./controllers
//= require nested_fields
//= require modal

App.ready = function () {

};
App.change = function () {
  $('#content > form :input:visible:first').focus();
  $('[data-toggle="tooltip"]').tooltip();
};
