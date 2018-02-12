import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['select', 'badge'];

  change() {
    this.badgeTarget.style.background = this.selectTarget.value;
  }
}
