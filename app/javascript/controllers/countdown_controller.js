
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static values = { end: String }

// Set the date we're counting down to

connect(){
  console.log(this.endValue)


var countDownDate = new Date(this.endValue).getTime();
// Update the count down every 1 second
var x = setInterval(function() {
// Get todays date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Output the result in an element with id="demo"
  if (days > 0) {
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";
  }
  else {
  document.getElementById("demo").innerHTML = hours + "h "
  + minutes + "m " + seconds + "s ";
  }

  // If the count down is over, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "The auction has ended!";
    document.getElementById("new_bid").style.visibility = 'hidden';
    fetch("<%= finish_bid_auction_item_url %>", {
      method: 'PATCH'
      // params: {"auction_items_id" => <%= auction_item.id %>  }
      });
  }
}, 1000);
}
}
