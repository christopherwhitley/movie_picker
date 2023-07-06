import Rails from "@rails/ujs"

window.onload = function() {
  const randomInt = Math.floor(Math.random() * (100 - 20 + 1) + 20)
  console.log('translateX will animate to: ',randomInt*100+"deg");

  const root = document.documentElement;
  root.style.setProperty('--random-int', randomInt*100+"deg");

    var wheel = document.getElementById("wheel")

    wheel.addEventListener("animationend", function() {
        doStuff()
    })
}

function doStuff() {


// Get the bounding box of the first element 
const clicker = document.getElementById("clicker"); 
const wheel = document.getElementById("wheel"); 
const message = document.getElementById("message")
const rect1 = clicker.getBoundingClientRect(); 
console.log("rect1", rect1)
clicker.style.pointerEvents = "none";
const elementsAtPoint = document.elementsFromPoint(rect1.x, rect1.bottom);
console.log("elementsAtPoint", elementsAtPoint[0].id)
const elementIds = elementsAtPoint.map(element => element.id); 
console.log("elementIds", elementIds)
const parentIndex = elementIds.indexOf("parent");

const childIndex = parentIndex - 1;

const childElement = elementsAtPoint[childIndex];
message.innerHTML = elementsAtPoint[0].textContent
console.log("CHILD", childElement)
 
// Get the bounding box of the second element 
const options = document.getElementsByClassName("option");
console.log(options);

setTimeout(() => {
Rails.ajax({
    url: "/films/",
    type: "GET",
    success: function(result) {
        window.location.href = '/films/' + elementsAtPoint[0].id
      },
    error: function(data) {console.log("AJAX error", data)}
  })
}, 3000);
}