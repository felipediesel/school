document.addEventListener("turbolinks:load", () => {
  $('[data-modal]').on("click", function (e) {
    e.preventDefault();
    Modal.fetch(this.href);
  });
});

class Modal {
  static show(html, options) {
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
  }

  static fetch(url) {
    fetch(url, {
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content
      },
      credentials: 'same-origin'
    }).then(function (response) {
      return response.text();
    }).then(function (content) {
      Modal.show(content);
    }).catch(function (err) {
      alert('An error happened.')
      console.log(err);
    });
  }
}
