window.onload = function() {
    toggle = document.getElementById("check_all")
    const checkboxes = document.querySelectorAll(".check_box");
    const radiobuttons = document.querySelectorAll(".custom_list_radio_button")

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            for (var i = 0; i < radiobuttons.length; i++) {
                if (checkbox.checked == true) {
                    radiobuttons[i].disabled = true
                }
                else radiobuttons[i].disabled = false
            }
        })
    });

    radiobuttons.forEach(function(radiobutton) {
        radiobutton.addEventListener('change', function() {
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].disabled = true
                toggle.disabled = true
            }
        })
    });

    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked == true)
        {
            for (var i = 0; i < radiobuttons.length; i++) {
                radiobuttons[i].disabled = true
            }
        }
    }
    // If 'Select all' checkbox is ticked
    window.toggleAll = function () {
        toggle = document.getElementById("check_all")
        if (toggle.checked == true) {
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = true;
            }
            
            for (var i = 0; i < radiobuttons.length; i++) {
                radiobuttons[i].disabled = true
            }

        }
        else {
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = false;
            }
            for (var i = 0; i < radiobuttons.length; i++) {
                radiobuttons[i].disabled = false
            }
        }

    }
}

