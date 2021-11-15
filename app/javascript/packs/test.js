

  button = document.getElementById('show-hide');
  itemsToHide = [...document.querySelectorAll('.release')].forEach(function(item) {
      item.style.display = 'none'
    });


  button.addEventListener('click', function() {

    itemsToHide = [...document.querySelectorAll('.release')].forEach(function(item) {
        if(item.style.display === 'none') {
          item.style.display = 'block';
        }
        else {
          item.style.display = 'none'
        }
      });

    });





//function finishFunction() {
//  alert ("Test message");
//}

//finishFunction();
