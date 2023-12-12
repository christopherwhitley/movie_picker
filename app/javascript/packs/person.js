
window.addEventListener('turbolinks:load', function(event) {

  // window.onload = function() {

  films = document.querySelectorAll(".film")
  for (let i = 0; i < films.length; i++) {
    hideTitle(films[i])
  };

  //films.forEach(displayTitle)


  for (let i = 0; i < films.length; i++) {
      films[i].addEventListener("mouseover", function (e) {
        displayTitle(films[i])
      });
    };

    for (let i = 0; i < films.length; i++) {
      console.log("HIT LOOP")
        films[i].addEventListener("mouseout", function (e) {
          hideTitle(films[i])
          const question = e.currentTarget
        });
      };

  function displayTitle(e) {
    e.style.opacity = '0.3'
    e.parentElement.querySelector(".title").style.display = 'block';
  }

  function hideTitle(e) {
    e.style.opacity = '1'
    e.parentElement.querySelector(".title").style.display = 'none';
  }
})