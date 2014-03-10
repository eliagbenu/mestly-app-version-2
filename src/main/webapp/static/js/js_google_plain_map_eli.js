function initialize_map() {

    var Init_latField = document.getElementById("Init1_latField").value;
    var Init_lngField = document.getElementById("Init1_lngField").value;
    var unset_map_co;

    if(Init_latField.length==0 )
    { 
        Init_latField = 5.552281; 
        Init_lngField = -0.202196; 
        unset_map_co = false;
    }else{
        unset_map_co = true;
    }

  var latlng = new google.maps.LatLng(Init_latField, Init_lngField);   

  var mapOptions = {
  center: latlng,
  zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
  mapOptions);

    if(unset_map_co){
        var marker = new google.maps.Marker({
            position: latlng, 
            map: map
        });        
    }

}


$(window).load(function(){
    initialize_map();
});