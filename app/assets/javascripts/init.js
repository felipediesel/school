(function () {
  "use strict";

  var _ = {
    ALIASES : {
      'create': 'new',
      'update': 'edit'
    },

    ready: function() {}, // Overwritten in application.js
    change: function() {}, // Overwritten in application.js

    change_controller: function () {
      if (App[document.body.id] !== undefined) {
        App[document.body.id]();
      }
    }
  };

  $(document).on("ready", function() {
    _.ready();
  });
  $(document).on("turbolinks:load", function() {
    _.change();
    _.change_controller();
  });

  self.App = _;

  return _;
} ());
