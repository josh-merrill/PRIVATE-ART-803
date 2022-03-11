
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static values = { end: String, url: String, info: Object, buyer: Object }

// Set the date we're counting down to

connect(){
  //console.log(typeof this.endValue)
  const urlTest = this.urlValue
  //console.log(urlTest)
  const artwork = this.infoValue;
  const buyer = this.buyerValue;

  //console.log(buyer);


var countDownDate = new Date(this.endValue.replace(/-/g, "/")).getTime();
//console.log(this.endValue.replace(" UTC", ""))
// Update the count down every 1 second
var x = setInterval(function() {
// Get todays date and time
  var now = new Date().getTime();
  //console.log(now)
  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  //console.log(typeof days)
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
    //console.log(urlTest);
    clearInterval(x);
    //document.getElementById("new_bid").style.visibility = 'hidden';
    document.getElementById("demo").innerHTML = "The auction has ended!";
    fetch(urlTest, {
      method: 'PATCH',
      body: JSON.stringify({
        title: 'foo',
      }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      // params: {"auction_items_id" => <%= auction_item.id %>  }
      })
      .then((response) => response.json())
      .then((json) => document.getElementById("new_bid").outerHTML = `<div class="flash flash-success"> <span><strong>Yay!</strong> 🎉 ${json.artwork.title} was sold to ${json.user.first_name} for ${json.artwork.price} EUR.</span> </div>`);
    //document.getElementById("new_bid").outerHTML = `<div class="flash flash-success"> <span><strong>Yay!</strong> 🎉 ${artwork['title']} was sold to ${buyer['first_name']} for ${artwork['price']} EUR.</span> </div>`;
    // const newArtwork = this.infoValue;
    //console.log(urlTest);
  }
}, 1000);
}
}
