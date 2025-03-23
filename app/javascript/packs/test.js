var overlay = document.getElementById("overlay")
var poster = document.getElementById("poster")

// Display full size poster on clicking poster
if (poster !== null)
  poster.addEventListener('click', function () {
    overlay.style.display = "block";
  });

// Hide full size poster on click
overlay.addEventListener('click', function () {
  overlay.style.display = "none";
});

// Show / hide film details
// button = document.getElementById('show-hide');
// itemsToHide = [...document.querySelectorAll('.release')].forEach(function (item) {
//   item.style.display = 'none'
// });
// button.addEventListener('click', function () {
//   itemsToHide = [...document.querySelectorAll('.release')].forEach(function (item) {
//     if (item.style.display === 'none') {
//       item.style.display = 'block';
//     }
//     else {
//       item.style.display = 'none'
//     }
//   });
// });

