

window.addEventListener('pageshow', () => {
  const banner = document.getElementById("banner");
  const films = document.querySelectorAll('.film');
  const bannerScrollWidth = banner.scrollWidth;
  const homepage = window.location.href;

  var refreshIntervalId = setInterval(function () {
    if (window.location.href != homepage) {
      console.log(window.location.href, homepage)
      banner.scrollTo(0, 0)
      continueScroll()
      return;
    }
    else if (banner.scrollLeft != bannerScrollWidth) {
      const banner = document.getElementById("banner");
      banner.scrollTo(banner.scrollLeft + 1, 0);

    }
    else if (banner.offsetWidth + banner.scrollLeft == banner.scrollWidth) {
      console.log("start again - initial")
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
      //console.log(secondInterval)
      if (window.location.href != homepage) {
        banner.scrollTo(0, 0)
        return;
      }
      else if (banner.scrollLeft != bannerScrollWidth) {
        banner.scrollTo(banner.scrollLeft + 1, 0);
      }
      else if (banner.offsetWidth + banner.scrollLeft == banner.scrollWidth) {
        console.log("start again - continue")
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
