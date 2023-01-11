

window.addEventListener('pageshow', () => {
  const banner = document.getElementById("banner");
  console.log("banner=", banner)
  const films = document.querySelectorAll('.film');
  const bannerScrollWidth = banner.scrollWidth;
  const homepage = window.location.href;

  var refreshIntervalId = setInterval(function () {
    const homepage = window.location.href;
    if (window.location.href != homepage) {
      console.log(window.location.href, homepage)
      banner.scrollTo(0, 0)
      continueScroll()
      return;
    }
    else if (banner.scrollLeft + banner.offsetWidth != bannerScrollWidth) {
      const banner = document.getElementById("banner");
      console.log("first interval scrolling")
      banner.scrollTo(banner.scrollLeft + 1, 0);

    }
    else if (banner.offsetWidth + banner.scrollLeft == bannerScrollWidth) {
      console.log("start again - initial")
      banner.scrollTo(0, 0)
      banner.scrollTo(banner.scrollLeft + 1, 0);
    }

  }, 15);

  films.forEach((f) => {
    f.addEventListener("mouseenter", stopScroll);
    console.log("mouseenter")
  });

  films.forEach((f) => {
    f.addEventListener("mouseleave", continueScroll);
  });

  films.forEach((f) => {
    f.addEventListener("mouseup", continueScroll);
  });

  function stopScroll() {
    clearInterval(refreshIntervalId);
    clearInterval(secondInterval);
    banner.style.overflow = 'none'
    console.log(window.location.href)
    console.log("stop")
    onpageshow = () => {
      continueScroll();
    };
  };

  function continueScroll() {
    console.log("continueScroll()")

    //banner.style.overflow = 'scroll'
    secondInterval = setInterval(function () {
      const films = document.querySelectorAll('.film');
      const homepage = window.location.href;
      let banner = document.getElementById("banner");
      onpageshow = () => { banner.scrollTo(0, 0) };

      films.forEach((f) => {
        f.addEventListener("mouseenter", stopScroll);
      });

      films.forEach((f) => {
        f.addEventListener("mouseleave", continueScroll);
      });

      films.forEach((f) => {
        f.addEventListener("mouseup", continueScroll);
      });

      if (window.location.href != homepage) {
        console.log("not homepage")
      }
      else if (banner.scrollLeft + banner.offsetWidth != bannerScrollWidth) {

        onpageshow = () => { banner.scrollTo(0, 0) };
        banner.scrollTo(banner.scrollLeft + 1, 0);
        console.log("scroll please", banner.offsetWidth + banner.scrollLeft, bannerScrollWidth)
        onvisibilitychange = () => { stopScroll() };
      }
      else if (banner.offsetWidth + banner.scrollLeft == bannerScrollWidth) {
        console.log("start again - continue")
        banner.scrollTo(0, 0)
        banner.scrollTo(banner.scrollLeft + 1, 0);
        console.log("style=", banner.style.overflow)
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
    });
  });

}
