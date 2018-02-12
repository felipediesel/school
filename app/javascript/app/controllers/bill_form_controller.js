import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "paid", "paidAtWrapper" ];

  update() {
    this.paidAtWrapper.hidden = !this.isPaid;
  }

  get paid() {
    return this.paidTarget;
  }

  get isPaid() {
    return this.paid.value != 'false';
  }

  get paidAtWrapper() {
    return this.paidAtWrapperTarget;
  }
}
