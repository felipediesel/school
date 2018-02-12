import dragula from 'dragula';

export default class NestedFields {
  constructor() {
    this.add_event();
    this.remove_event();
  }

  sort() {
    dragula([document.getElementById('levels_fields')]).on('drop', function () {
      Array.prototype.forEach.call(document.querySelectorAll('#levels_fields .position'), function(el, i){
        el.value = i;
      });
    });
  }

  add_event() {
    $('form .add_fields').on('click', function(event) {
      var regexp = new RegExp($(this).data('id'), 'g'),
        time = new Date().getTime();

      $('#' + $(this).data('association') + '_fields').append($(this).data('fields').replace(regexp, time));
      event.preventDefault();
    });
  }

  remove_event() {
    $('form').on('click', '.remove_fields', function(event) {
      $(this).closest('fieldset').find('[data-destroy]').val('1');
      $(this).closest('fieldset').hide();
      event.preventDefault();
    });
  }
}
