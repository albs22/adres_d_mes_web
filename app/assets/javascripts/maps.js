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

function addGenericMarker(latLng) {
  if (marker) {
    marker.setPosition(latLng);
  } else {
     marker = new google.maps.Marker({
      position: latLng,
      map: map
    });
  }
}

function RoundLatLng(latLng) {
    //GPS accuracy 6 places = .111 m
    var decimalPlaces = 6;
    return latLng.toFixed(decimalPlaces);
}

function addMarker(name, type, description, lattitude, longitude)
{
    var markerLatLng = new google.maps.LatLng(lattitude, longitude);
    var infoContentString = '<h3>' + name + '</h3>' + '<p>' + description + '</p>' + '<img alt="V_001_sm" src="/assets/v_001_sm.jpg">'

    var infoWindow = new google.maps.InfoWindow({
        content: infoContentString
        
    });
    
    //var image = "../../Content/MarkerImages/m"+ position + ".png";
    var markerIcon = getMarkerIcon(type);
   
    var marker = new google.maps.Marker({
        position: markerLatLng,
        title: name,
        map: map,
        icon: markerIcon,
        draggable: false
    });

    google.maps.event.addListener(marker, 'click', function() {
        infoWindow.open(map, marker);
        
    });       
}


function getMarkerIcon(type) {
  var iconBase = "/assets/marker_";
  var icon;

  switch(type) {
  case("mess"):
      icon = iconBase + "orange.png";
      break;
    case("weeds"):
      icon = iconBase + "yellow.png";
      break;
    case("bigitem"):
      icon = iconBase + "red.png";
      break;
    default:
      icon = iconBase + "orange.png";
  }

  return icon;
}



