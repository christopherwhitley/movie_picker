window.toggleAll = function () {
    toggle = document.getElementById("check_all")
    const checkboxes = document.getElementsByClassName("check_box");
    console.log(toggle)
    if (toggle.checked == true) {
        console.log(checkboxes)
        for (var i = 0; i < checkboxes.length; i++) {
            console.log(checkboxes[i])
            checkboxes[i].checked = true;
        }
    }
    else {
        for (var i = 0; i < checkboxes.length; i++) {
            console.log(checkboxes[i])
            checkboxes[i].checked = false;
        }
    }
}


