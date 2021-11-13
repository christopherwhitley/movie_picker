window.onload=function(){

  [...document.querySelectorAll('.home-button')].forEach(function(item) {
    item.addEventListener('mouseenter', function() {
      this.style.background = "#9DFED7";
    });
    item.addEventListener('mouseleave', function() {
      this.style.background = "#EAFBF4";
     });
     });

}
