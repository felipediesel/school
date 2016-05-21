(function () {
  "use strict";

  var _ = function () {
    $('#bill_paid').change(function () {
      $('.bill_paid_at').attr('hidden', $(this).val() === 'false');
    });
  };

  self.App.bills = _;

  return _;
} ());
