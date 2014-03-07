

    function initialize() {
      var mapOptions = {
      center: new google.maps.LatLng(5.552281, -0.202196),
      zoom: 8
      };
      var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
      }
    google.maps.event.addDomListener(window, 'load', initialize);
