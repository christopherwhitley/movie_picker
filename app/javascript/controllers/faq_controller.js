import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static classes = ["change"]

  show(event) {
    const question = event.currentTarget.closest(".question")
    question.classList.toggle(this.changeClass)

    const arrow = event.currentTarget.querySelector(".faq-arrow")
    if (arrow) {
      arrow.textContent = question.classList.contains(this.changeClass) ? "▲" : "▼"
    }
  }
}
