import { Controller } from "stimulus";
import NestedFields from "../nested_fields.js";

export default class extends Controller {
  static targets = ['color', 'colorBox'];

  initialize() {
    this.nestedFields = new NestedFields();
    this.nestedFields.sort();
  }

  changeColor() {
    $('form').on('change', '.modality_levels_color select', function (){
      $(this).closest('fieldset').find('.level-color').css('background', this.value);
    });

  }
}
