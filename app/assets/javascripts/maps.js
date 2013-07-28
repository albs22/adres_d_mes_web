/*
gm_init = ->
  gm_center = new google.maps.LatLng(32.222, -110.972)
  gm_map_type = google.maps.MapTypeId.ROADMAP
  map_options = {center: gm_center, zoom: 14, mapTypeId: gm_map_type}
  new google.maps.Map(@map_canvas,map_options);


$ ->
  map = gm_init()
  
  */
  
  /*
  $(document).ready(function () {
    InitializeMap(32.22, -110.972);
  });
  */
  
  
  
function InitializeMap(lat, lng) {

    var latlng = new google.maps.LatLng(lat, lng);
    var myOptions = { zoom: 13, center: latlng, mapTypeId: google.maps.MapTypeId.ROADMAP };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}


function addMarker(name, description, lattitude, longitude, image_path)
{
    console.log(image_path);
    console.log("Add Marker");
     var image ="/assets/" + image_path
    var markerLatLng = new google.maps.LatLng(lattitude, longitude);
    var infoContentString = '<h3>' + name + '</h3>' + '<p>' + description + '</p>' + '<img alt="V_001_sm" src="/assets/v_001_sm.jpg">'

    var infoWindow = new google.maps.InfoWindow({
        content: infoContentString
        
    });
    
    //var image = "../../Content/MarkerImages/m"+ position + ".png";
   
    var marker = new google.maps.Marker({
        position: markerLatLng,
        title: name,
        map: map,
        //icon: image,
        draggable: false
    });

    google.maps.event.addListener(marker, 'click', function() {
        infoWindow.open(map, marker);
        
    });       
}

