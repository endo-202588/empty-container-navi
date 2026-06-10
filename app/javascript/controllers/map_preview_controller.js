import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "x",
    "y",
    "name",
    "nameInput"
  ]

  update() {
    const x = this.xTarget.value || 50
    const y = this.yTarget.value || 50

    this.nameTarget.style.left = `${x}%`
    this.nameTarget.style.top = `${y}%`
  }

  updateName() {
    this.nameTarget.textContent =
      this.nameInputTarget.value
  }
}