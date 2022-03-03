import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { bidroomId: Number }
  static targets = ["input", "form", "content"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "BidroomChannel", id: this.bidroomIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.bidroomIdValue}.`)
  }
  }
