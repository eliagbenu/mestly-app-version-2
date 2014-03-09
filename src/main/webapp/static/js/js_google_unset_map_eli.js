var map;
var markersArray = [];

function initialize()
{


    var Init_latField = document.getElementById("Init_latField").value;
    var Init_lngField = document.getElementById("Init_lngField").value;

	var latlng = new google.maps.LatLng(Init_latField, Init_lngField);	    
    var myOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("unset-map-canvas"), myOptions);

    var marker = new google.maps.Marker({
        position: latlng, 
        map: map
    });

    // add a click event handler to the map object
    google.maps.event.addListener(map, "click", function(event)
    {
        // place a marker
        placeMarker(event.latLng);

        // display the lat/lng in your form's lat/lng fields
        document.getElementById("latField").value = event.latLng.lat();
        document.getElementById("lngField").value = event.latLng.lng();
    });
}

function placeMarker(location) {
    // first remove all markers if there are any
    deleteOverlays();

    var marker = new google.maps.Marker({
        position: location, 
        map: map
    });

    // add marker in markers array
    markersArray.push(marker);

    //map.setCenter(location);
}

// Deletes all markers in the array by removing references to them
function deleteOverlays() {
    if (markersArray) {
        for (i in markersArray) {
            markersArray[i].setMap(null);
        }
    markersArray.length = 0;
    }
}

//google.maps.event.addDomListener(window, 'load', initialize);


$(window).load(function(){
	initialize();
});