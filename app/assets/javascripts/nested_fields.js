(function () {
  "use strict";

  var _ = function () {
    $(document).on('click', 'form .remove_fields', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('fieldset').hide();
      event.preventDefault();
    });

    $(document).on('click', 'form .add_fields', function(event) {
      var regexp = new RegExp($(this).data('id'), 'g'),
        time = new Date().getTime();

      $('#' + $(this).data('association') + '_fields').append($(this).data('fields').replace(regexp, time));
      event.preventDefault();
    });
  };

  self.nested_fields = _;

  return _;
} ());
