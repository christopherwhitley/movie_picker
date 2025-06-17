

window.addEventListener('turbolinks:load', () => {
  //Banner
  const banner = document.getElementById("banner");
  if (banner === null) {
    return;
  }
  const films = document.querySelectorAll('.film');
  const bannerScrollWidth = banner.scrollWidth;
  const homepage = window.location.href;


  var refreshIntervalId = setInterval(function () {
    const homepage = window.location.href;

    if (banner === null) {
      return;
    }

    if (window.location.href != homepage) {
      // banner.scrollTo(0, 0)
      // continueScroll()
      return;
    }
    else if (banner.scrollLeft + banner.offsetWidth != bannerScrollWidth) {
      const banner = document.getElementById("banner");
      if (banner === null) {
        return;
      }
      banner.scrollTo(banner.scrollLeft + 1, 0);

    }
    else if (banner.offsetWidth + banner.scrollLeft == bannerScrollWidth) {
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

  films.forEach((f) => {
    f.addEventListener("mouseup", continueScroll);
  });

  function stopScroll() {
    clearInterval(refreshIntervalId);
    clearInterval(secondInterval);
    banner.style.overflow = 'none'
    onpageshow = () => {
      continueScroll();
    };
  };

  function continueScroll() {

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


      if (banner.scrollLeft + banner.offsetWidth != bannerScrollWidth) {

        onpageshow = () => { banner.scrollTo(0, 0) };
        banner.scrollTo(banner.scrollLeft + 1, 0);
        onvisibilitychange = () => { stopScroll() };
      }
      else if (banner.offsetWidth + banner.scrollLeft == bannerScrollWidth) {
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
}


