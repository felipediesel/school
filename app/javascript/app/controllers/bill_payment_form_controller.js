import { Controller } from "stimulus";
import Modal from "../modal"
// import Helpers from "../helpers";

export default class extends Controller {
  static targets = [ "form" ];
    initialize() {

    this.form.addEventListener('ajax:success', function (event) {
      let data = event.detail[0];

      document.getElementById(`bill_${data.id}`).outerHTML = data.html;
      Modal.hide()
    });
  }

  get form() {
    return this.formTarget;
  }
}
