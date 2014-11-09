var map, marker;

function initMap(targetId, type) {
  var latlng = new google.maps.LatLng(32.2460, -110.9595);
  var myOptions =  { zoom: 13, center: latlng, mapTypeId:google.maps.MapTypeId.ROADMAP };
  map = new google.maps.Map(document.getElementById(targetId), myOptions);

  switch(type) {
    case "event_create":
      eventCreateMap();
      break;
    case "mess_list":
      messListMap();
      break;
    case "mess_create":
      messCreateMap();
      break;
  }

  function eventCreateMap() {
    addFormMarkerOnClick('event');
  }

  function messListMap() {

  }

  function messCreateMap() {
    addFormMarkerOnClick('violation');
  }

  function addFormMarkerOnClick(fieldName) {
     console.log("add mark onclick");
     google.maps.event.addListener(map, 'click', function (event) {
        addGenericMarker(event.latLng);
        //populate for lat, lng form fields
        document.getElementById(fieldName + '_lat').value =  RoundLatLng(event.latLng.lat());
        document.getElementById(fieldName + '_lng').value = RoundLatLng(event.latLng.lng());
     });
  }
}

function addGenericMarker(location) {
  if (marker) {
        marker.setPosition(location);
    } else {
        marker = new google.maps.Marker({
            position: location,
            map: map
        });
    }
}

function RoundLatLng(latLng) {
    //GPS accuracy 6 places = .111 m
    var decimalPlaces = 6;
    return latLng.toFixed(decimalPlaces);
}

function addMarker(name, description, lattitude, longitude)
{
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

