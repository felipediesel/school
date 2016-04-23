(function () {
  "use strict";

  var _ = function () {
    _.add_event();
    _.remove_event();
  };

  _.add_event = function () {
    $('form .add_fields').on('click', function(event) {
      var regexp = new RegExp($(this).data('id'), 'g'),
        time = new Date().getTime();

      $('#' + $(this).data('association') + '_fields').append($(this).data('fields').replace(regexp, time));
      event.preventDefault();
    });
  };

  _.remove_event = function () {
    $('form').on('click', '.remove_fields', function(event) {
      alert('aaaa')
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('fieldset').hide();
      event.preventDefault();
    });
  };

  self.nestedFields = _;

  return _;
} ());
