(function () {
  "use strict";

  var _ = function (html, options) {
    var modalObj, exp;
    if (options === undefined) {
      options = {};
    }
    $('body').append(html);
    modalObj = $('.modal');
    modalObj.modal(options).on('hidden.bs.modal', function (e) {
      $(this).remove();
    });

    return modalObj;
  };
  self.modal = _;

  return _;
} ());
