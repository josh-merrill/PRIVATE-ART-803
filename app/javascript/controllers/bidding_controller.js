import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { bidroomId: Number }
  static targets = ["input", "form", "content"]

  connect() {
    console.log(this.contentTarget)
    this.channel = consumer.subscriptions.create(
      { channel: "BidroomChannel", id: this.bidroomIdValue },
      { received: data => this.contentTarget.insertAdjacentHTML("beforeend", data) }
    )

  }
  }
