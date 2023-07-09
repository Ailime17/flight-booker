import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "addTemplate"]
  static values = { count: Number}

  showTemplate() {
    this.clone = this.addTemplateTarget.content.cloneNode(true)
    this.element.appendChild(this.clone)
  }

  hideTemplate() {
    if(this.countValue > 1) {
      this.element.removeChild(this.templateTarget)
    }
  }
}
