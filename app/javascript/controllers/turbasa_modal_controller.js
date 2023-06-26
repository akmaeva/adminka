import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbasa-model"
export default class extends Controller {
  connect() {
    console.log('connect!!!')
  }

  initialize() {
    this.element.setAttribute("data-action", "click->turbasa-model#showModel")
  }

  showModel(event) {
    event.preventDefault()
    this.url = this.element.getAttribute("href")
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
