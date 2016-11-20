// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function getParameter(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) {
			return sParameterName[1];
		}
	}
}

// ////////

var map;
var myPosition;

function setCurrentPosition(pos) {
	if (myPosition) {
		myPosition.setMap(null);
	}
	myPosition = new google.maps.Marker({
        map: map,
        position: new google.maps.LatLng(
            pos.coords.latitude,
            pos.coords.longitude
        ),
        icon: "../assets/avatars/male-1.png",
        title: "ME"
    });
    map.panTo(new google.maps.LatLng(
            pos.coords.latitude,
            pos.coords.longitude
        ));
}

function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : 40.33,
			lng : 150.644
		},
		zoom : 18,
		mapTypeControl : false,
		overviewMapControl : false,
		streetViewControl : false,
		zoomControlOptions : {
			position : google.maps.ControlPosition.TOP_RIGHT,
			style : google.maps.ZoomControlStyle.LARGE
		},
	});
	var styles = [ {
		"featureType" : "road",
		"elementType" : "labels",
		"stylers" : [ {
			"visibility" : "on"
		} ]
	}, {
		"featureType" : "poi",
		"stylers" : [ {
			"visibility" : "off"
		} ]
	}, {
		"featureType" : "administrative",
		"stylers" : [ {
			"visibility" : "off"
		} ]
	}, {
		"featureType" : "road",
		"elementType" : "geometry.fill",
		"stylers" : [ {
			"color" : "#000000"
		}, {
			"weight" : 1
		} ]
	}, {
		"featureType" : "road",
		"elementType" : "geometry.stroke",
		"stylers" : [ {
			"color" : "#000000"
		}, {
			"weight" : 0.8
		} ]
	}, {
		"featureType" : "landscape",
		"stylers" : [ {
			"color" : "#ffffff"
		} ]
	}, {
		"featureType" : "water",
		"stylers" : [ {
			"visibility" : "off"
		} ]
	}, {
		"featureType" : "transit",
		"stylers" : [ {
			"visibility" : "off"
		} ]
	}, {
		"elementType" : "labels",
		"stylers" : [ {
			"visibility" : "on"
		} ]
	}, {
		"elementType" : "labels.text",
		"stylers" : [ {
			"visibility" : "on"
		} ]
	}, {
		"elementType" : "labels.text.stroke",
		"stylers" : [ {
			"color" : "#ffffff"
		} ]
	}, {
		"elementType" : "labels.text.fill",
		"stylers" : [ {
			"color" : "#000000"
		} ]
	}, {
		"elementType" : "labels.icon",
		"stylers" : [ {
			"visibility" : "on"
		} ]
	} ];

	map.setOptions({
		styles : styles
	});

	navigator.geolocation.watchPosition(function(position) {
		setCurrentPosition(position);
	});

}

$(document).ready(function() {
	initMap();
});
