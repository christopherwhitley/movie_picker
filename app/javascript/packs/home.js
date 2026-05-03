// Banner scroll with a single animation loop and explicit cleanup
window.bannerScrollState = {
  rafId: null,
  banner: null,
  pauseHandler: null,
  resumeHandler: null,
  paused: false,
  accumulatedScroll: 0,
  scrollSpeed: 0.25, // Adjust this to control speed
};

function cleanupBannerScroll() {
  if (window.bannerScrollState.rafId !== null) {
    cancelAnimationFrame(window.bannerScrollState.rafId);
    window.bannerScrollState.rafId = null;
  }

  if (window.bannerScrollState.banner && window.bannerScrollState.pauseHandler && window.bannerScrollState.resumeHandler) {
    window.bannerScrollState.banner.removeEventListener('mouseenter', window.bannerScrollState.pauseHandler);
    window.bannerScrollState.banner.removeEventListener('mouseleave', window.bannerScrollState.resumeHandler);
  }

  window.bannerScrollState.banner = null;
  window.bannerScrollState.pauseHandler = null;
  window.bannerScrollState.resumeHandler = null;
  window.bannerScrollState.paused = false;
  window.bannerScrollState.accumulatedScroll = 0;
}

function animateBanner() {
  const banner = document.getElementById('banner');
  if (banner && !window.bannerScrollState.paused) {
    const bannerScrollWidth = banner.scrollWidth;
    const maxScroll = bannerScrollWidth - banner.offsetWidth;

    window.bannerScrollState.accumulatedScroll += window.bannerScrollState.scrollSpeed;
    const pixelsToScroll = Math.floor(window.bannerScrollState.accumulatedScroll);

    if (pixelsToScroll > 0) {
      window.bannerScrollState.accumulatedScroll -= pixelsToScroll;

      if (banner.scrollLeft + pixelsToScroll >= maxScroll) {
        banner.scrollTo(0, 0);
        window.bannerScrollState.accumulatedScroll = 0;
      } else {
        banner.scrollTo(banner.scrollLeft + pixelsToScroll, 0);
      }
    }
  }

  window.bannerScrollState.rafId = requestAnimationFrame(animateBanner);
}

function initBannerScroll() {
  cleanupBannerScroll();

  const banner = document.getElementById('banner');
  if (!banner) return;

  banner.scrollTo(0, 0);
  window.bannerScrollState.banner = banner;
  window.bannerScrollState.paused = false;
  window.bannerScrollState.accumulatedScroll = 0;

  window.bannerScrollState.pauseHandler = () => {
    window.bannerScrollState.paused = true;
  };
  window.bannerScrollState.resumeHandler = () => {
    window.bannerScrollState.paused = false;
  };

  banner.addEventListener('mouseenter', window.bannerScrollState.pauseHandler);
  banner.addEventListener('mouseleave', window.bannerScrollState.resumeHandler);

  window.bannerScrollState.rafId = requestAnimationFrame(animateBanner);
}

window.addEventListener('pageshow', initBannerScroll);
window.addEventListener('turbolinks:load', initBannerScroll);
window.addEventListener('turbolinks:before-cache', cleanupBannerScroll);
window.addEventListener('pagehide', cleanupBannerScroll);
window.addEventListener('beforeunload', cleanupBannerScroll);


window.onload = function () {
  [...document.querySelectorAll('.home-button')].forEach(function (item) {
    item.addEventListener('mouseenter', function () {
      this.style.background = '#9DFED7';
    });
    item.addEventListener('mouseleave', function () {
      this.style.background = '#EAFBF4';
    });
  });
}


