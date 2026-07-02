import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["current", "password", "confirmation"];

  toggle(event) {
    const type = event.target.checked ? "text" : "password";

    this.currentTargets.forEach((el) => {
      el.type = type;
    });

    this.passwordTargets.forEach((el) => {
      el.type = type;
    });

    this.confirmationTargets.forEach((el) => {
      el.type = type;
    });
  }
}
