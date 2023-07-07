import Rails from "@rails/ujs"

window.onload = function() {
  const titles = document.getElementsByClassName("film_title")
  const question_marks = document.getElementsByClassName("question_marks")
  const box_one = document.getElementById("box1")
  const box_two = document.getElementById("box2")
  
  for (let i = 0; i < titles.length; i++) {
    titles[i].style.display = 'none'
}
  const spinner = document.getElementById("spin")

  spinner.addEventListener("click", function() {
    setTimeout(() => {
      const position = arrow.getBoundingClientRect(); 
      arrow.style.pointerEvents = "none";
      const elementsAtPoint = document.elementsFromPoint(position.x, position.y);

      if (elementsAtPoint[0].classList.contains('box1') || elementsAtPoint[0].classList.contains('box2')){
        elementsAtPoint[1].firstElementChild.style.display = 'none'
        elementsAtPoint[1].lastElementChild.style.display = 'block'

        // elementsAtPoint[1].lastElementChild.addEventListener("click", function() {
        //   location.href = "/films/" + '56'
        // }), true

      }
      else {
        elementsAtPoint[0].firstElementChild.style.display = 'none'
        elementsAtPoint[0].lastElementChild.style.display = 'block'

        // elementsAtPoint[0].lastElementChild.addEventListener("click", function() {
        //   location.href = "/films/" + '56'
        // }), true
      }
    }, 5000)
  }), true

}

window.rotateFunction = function () {
  var min = 1024;
  var max = 9999;
  var deg = Math.floor(Math.random() * (max - min)) + min;
  document.getElementById('box').style.transform = "rotate("+deg+"deg)";
  var element = document.getElementById('mainbox');
  element.classList.remove('animate');
  setTimeout(function(){
    element.classList.add('animate');
  }, 5000);
}

// function doStuff() {


// Get the bounding box of the first element 
// const clicker = document.getElementById("clicker"); 
// const wheel = document.getElementById("wheel"); 
// const message = document.getElementById("message")
// const rect1 = clicker.getBoundingClientRect(); 
// console.log("rect1", rect1)
// clicker.style.pointerEvents = "none";
// const elementsAtPoint = document.elementsFromPoint(rect1.x, rect1.bottom);
// console.log("elementsAtPoint", elementsAtPoint[0].id)
// const elementIds = elementsAtPoint.map(element => element.id); 
// console.log("elementIds", elementIds)
// const parentIndex = elementIds.indexOf("parent");

// const childIndex = parentIndex - 1;

// const childElement = elementsAtPoint[childIndex];
// message.innerHTML = elementsAtPoint[0].textContent
// console.log("CHILD", childElement)
 
// // Get the bounding box of the second element 
// const options = document.getElementsByClassName("option");
// console.log(options);

// setTimeout(() => {
// Rails.ajax({
//     url: "/films/",
//     type: "GET",
//     success: function(result) {
//         window.location.href = '/films/' + elementsAtPoint[0].id
//       },
//     error: function(data) {console.log("AJAX error", data)}
//   })
// }, 3000);
// }