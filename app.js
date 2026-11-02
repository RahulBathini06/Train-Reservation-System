function swapStations() {

    var source = document.getElementById("source");
    var destination = document.getElementById("destination");

    var temp = source.value;

    source.value = destination.value;
    destination.value = temp;
}


function setRoute(from, to) {

    document.getElementById("source").value = from;

    document.getElementById("destination").value = to;

    document.getElementById("searchBox").scrollIntoView({
        behavior: "smooth",
        block: "center"
    });

}


function validateSearch() {

    var source =
        document.getElementById("source").value.trim();

    var destination =
        document.getElementById("destination").value.trim();


    if (source === "" || destination === "") {

        alert("Please enter source and destination.");

        return false;
    }


    if (source.toLowerCase() ===
        destination.toLowerCase()) {

        alert("Source and destination cannot be the same.");

        return false;
    }


    return true;
}


/* Booking page - 1 to 6 passengers */

function showPassengers() {

    var countElement =
        document.getElementById("count");


    if (!countElement) {
        return;
    }


    var count =
        parseInt(countElement.value);


    for (var i = 1; i <= 6; i++) {

        var passenger =
            document.getElementById("p" + i);


        if (!passenger) {
            continue;
        }


        if (i <= count) {

            passenger.style.display = "block";


            var inputs =
                passenger.querySelectorAll(
                    "input[type='text'], input[type='number']"
                );


            for (var j = 0; j < inputs.length; j++) {

                inputs[j].required = true;

            }

        } else {

            passenger.style.display = "none";


            var inputs =
                passenger.querySelectorAll(
                    "input[type='text'], input[type='number']"
                );


            for (var j = 0; j < inputs.length; j++) {

                inputs[j].required = false;

            }

        }

    }

}


window.onload = function() {

    if (document.getElementById("count")) {

        showPassengers();

    }

};