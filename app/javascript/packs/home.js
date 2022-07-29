window.onload=function(){


  [...document.querySelectorAll('.home-button')].forEach(function(item) {
    item.addEventListener('mouseenter', function() {
      this.style.background = "#9DFED7";
    });
    item.addEventListener('mouseleave', function() {
      this.style.background = "#EAFBF4";
     });
     });


const btns = document.querySelectorAll(".question-btn");

btns.forEach(function (btn) {
  btn.addEventListener("click", function (e) {
    const question = e.currentTarget.parentElement.parentElement
    question.classList.toggle ("show-text")
    //console.log("hello");
      //console.log(e.currentTarget.parentElement.parentElement);
      ;
  });
});

}
