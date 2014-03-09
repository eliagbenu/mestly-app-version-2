

function initialize() {
 var myLatlng = new google.maps.LatLng(5.552281, -0.202196);	

  var mapOptions = {
  center: myLatlng,
  zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
  mapOptions);


custIcon = '/static/img/bulbgrey.png';
var myLocation = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'You are here!',
      icon:custIcon
  });

  }
google.maps.event.addDomListener(window, 'load', initialize);
