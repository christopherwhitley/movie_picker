

window.addEventListener('DOMContentLoaded', () => {
  const banner = document.getElementById("banner");
  const films = document.querySelectorAll('.film');
  const bannerScrollWidth = banner.scrollWidth;

  var refreshIntervalId = setInterval(function () {
    console.log(refreshIntervalId)
    if (banner.scrollLeft != bannerScrollWidth) {
      banner.scrollTo(banner.scrollLeft + 1, 0);

    }
    if (banner.offsetWidth + banner.scrollLeft == banner.scrollWidth) {
      console.log("start again")
      banner.scrollTo(0, 0)
      banner.scrollTo(banner.scrollLeft + 1, 0);
    }
  }, 15);

  films.forEach((f) => {
    f.addEventListener("mouseenter", stopScroll);
  });

  films.forEach((f) => {
    f.addEventListener("mouseleave", continueScroll);
  });

  function stopScroll() {
    clearInterval(refreshIntervalId);
    clearInterval(secondInterval);
    banner.style.overflow = 'none'
    console.log("stop")
  };
  function continueScroll() {
    console.log("start")
    banner.style.overflow = 'scroll'
    secondInterval = setInterval(function () {
      console.log(secondInterval)
      if (banner.scrollLeft != bannerScrollWidth) {
        banner.scrollTo(banner.scrollLeft + 1, 0);
      }
      if (banner.offsetWidth + banner.scrollLeft == banner.scrollWidth) {
        console.log("start again")
        banner.scrollTo(0, 0)
        banner.scrollTo(banner.scrollLeft + 1, 0);
      }
    }, 15);
  };
});



window.onload = function () {

  [...document.querySelectorAll('.home-button')].forEach(function (item) {
    item.addEventListener('mouseenter', function () {
      this.style.background = "#9DFED7";
    });
    item.addEventListener('mouseleave', function () {
      this.style.background = "#EAFBF4";
    });
  });


  const btns = document.querySelectorAll(".question-btn");

  btns.forEach(function (btn) {
    btn.addEventListener("click", function (e) {
      const question = e.currentTarget.parentElement.parentElement
      question.classList.toggle("show-text")
      //console.log("hello");
      //console.log(e.currentTarget.parentElement.parentElement);
    });
  });

}
