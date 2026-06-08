import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["x", "y", "marker"]

  update() {
    this.markerTarget.style.left = `${this.xTarget.value}%`
    this.markerTarget.style.top = `${this.yTarget.value}%`
  }
}