import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  copy(event) {
    event.preventDefault()
    navigator.clipboard.writeText(this.inputTarget.value)
    // this.inputTarget.focus();
    // this.inputTarget.select();
    // document.execCommand('copy');
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = this.feedbackTextValue;
  }
}
