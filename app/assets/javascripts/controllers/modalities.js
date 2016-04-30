(function () {
  "use strict";

  var _ = function () {
    nestedFields().sort();

    $('form').on('change', '.modality_levels_color select', function (){
      $(this).closest('fieldset').find('.level-color').css('background', this.value);
    });

  };

  self.App.modalities = _;

  return _;
} ());
