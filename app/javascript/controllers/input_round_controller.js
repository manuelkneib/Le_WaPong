import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input-round"
export default class extends Controller {

  static targets = ["player1", "player2"]

  send(event) {
    const winner = event.currentTarget
    winner.classList.add("btn", "btn-success", "match-winner")

    if (this.player1Target === winner) {
      this.player2Target.classList.remove("btn", "btn-success", "match-winner")
    }
    else {
      this.player1Target.classList.remove("btn", "btn-success", "match-winner")
    }

    // fetch(url, {
    //   method: "POST",
    //   headers: { "Accept": "application/json" },
    //   body: ????
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })
  }
}
