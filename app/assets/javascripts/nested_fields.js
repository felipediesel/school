(function () {
  "use strict";

  var _ = function () {
    $('form .remove_fields').on('click', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('fieldset').hide();
      event.preventDefault();
    });

    $('form .add_fields').on('click', function(event) {
      var regexp = new RegExp($(this).data('id'), 'g'),
        time = new Date().getTime();

      $('#' + $(this).data('association') + '_fields').append($(this).data('fields').replace(regexp, time));
      event.preventDefault();
    });
  };

  self.nested_fields = _;

  return _;
} ());
