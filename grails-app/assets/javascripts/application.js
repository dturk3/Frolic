// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$('.btn-group-vertical button').click(function()
{
    $(this).parent().children().removeClass('active');
    $(this).addClass('active');
});

function getParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}

//////////

var map;
var markers = [];
var infoWindows = [];
var directionsDisplay = new google.maps.DirectionsRenderer();

directionsDisplay.setOptions({
    draggable: false,
    suppressMarkers: true})
    
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : 40.33,
			lng : 150.644
		},
		zoom : 13,
		mapTypeControl: false,
		overviewMapControl: false,
		streetViewControl: false,
		zoomControlOptions: {position: google.maps.ControlPosition.TOP_RIGHT, style: google.maps.ZoomControlStyle.LARGE},
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
	directionsDisplay.setMap(map);
}

var frolicResponse;
var waypts = [];

function calcRoute() {
	var waypts = [];
	for (var i = 0; i < arguments.length; i++) {
		waypts.push({
			location : arguments[i],
			stopover : true
		});
	}
}

function secondsToTime(secs) {
	var hours = Math.floor(secs / (60 * 60));

	var divisor_for_minutes = secs % (60 * 60);
	var minutes = Math.floor(divisor_for_minutes / 60);

	var divisor_for_seconds = divisor_for_minutes % 60;
	var seconds = Math.ceil(divisor_for_seconds);

	var obj = {
		"h" : hours,
		"m" : minutes,
		"s" : seconds
	};
	return obj;
}

function buildHighlights(points)
{
    if (markers.length > 0) {
        return;
    }
    if (map == undefined || points.length == 0) {
        return;
    }
    for (var i = 0; i < points.length; i++) {
        var marker = new google.maps.Marker({
            position: points[i],
        });
        
        var ratingString = "";
        for (var j = 1; j <= 5; j++) {
        	if (j <= frolicResponse.place[i].rating) {
        		ratingString += '<span class="glyphicon glyphicon-star" aria-hidden="true"></span>';
        		continue;
        	}
    		ratingString += '<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>';
        }
        
        var phone = "";
        
        if (frolicResponse.place[i].phone != null) {
        	phone += frolicResponse.place[i].phone;
        }
        
        marker.infoWindow = new google.maps.InfoWindow({
        	content: '<img style= "float: left; margin-right: 5px; margin-bottom: 5px; border: 1px solid black" src="' + frolicResponse.place[i].imageUrl + '"><h6 style="margin-bottom: 10px;">' + frolicResponse.place[i].name + '</h6>'
	        	+ '<div style="font-size:12px">' + ratingString + '</div>'
	        	+ '<div style="font-size:12px">' + phone + '<br>' + frolicResponse.place[i].address + '</div>'
        		+ ""
        });
        marker.setIcon('https://chart.googleapis.com/chart?chst=d_map_xpin_letter&chld=pin|' + (markers.length + 1) + '|42DCA3|000000');
        markers.push(marker);
        marker.setMap(map);
    }
    
    for (var i = 0; i < markers.length; i++) {
        markers[i].addListener('click', function() {
        	for (var i = 0; i < markers.length; i++) {
        		markers[i].infoWindow.close();
        	}
        	this.infoWindow.open(map, this);
          });
    }
    
    map.addListener('click', function() {
    	for (var i = 0; i < markers.length; i++) {
    		markers[i].infoWindow.close();
    	}
    });
}

function handleDirections() {
	var directionsService = new google.maps.DirectionsService();
	var map;
	var points = [];
	var markers = [];

	var start = waypts[0]['location'];
	var end = waypts[waypts.length - 1]['location'];
	var stops = waypts.slice(1, waypts.length - 1);
	var request = {
		origin : start,
		destination : end,
		waypoints : stops,
		optimizeWaypoints : true,
		provideRouteAlternatives : false,
		travelMode : google.maps.TravelMode.WALKING
	};
	console.log(request);

	directionsService.route(request, function(response, status) {
		var distanceMeters = 0;
		var durationSeconds = 0;
		console.log(status);
		for (var i = 0; i < response.routes[0].legs.length; i++) {
			var leg = response.routes[0].legs[i];
			distanceMeters += leg.distance.value;
			durationSeconds += leg.duration.value;
		}
		// $("#id-distance").html((distanceMeters/1000).toFixed(1) + " km");
		var duration = secondsToTime(durationSeconds + (45 * 60)
				* waypts.length);
		// $("#id-duration").html(duration.h + " h " + duration.m + " min");
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
		}
		
		if (status == google.maps.DirectionsStatus.ZERO_RESULTS) {
			window.location("/frolic/index");
			return;
		}


		for (var i = 0; i < response.routes[0].legs.length; i++) {
			var leg = response.routes[0].legs[i];
			points.push(leg.start_location);
			if (i == response.routes[0].legs.length - 1) {
				points.push(leg.end_location);
			}
		}
		buildHighlights(points);
	});
}

$(document).ready(function() {
	$(".navbar-toggle").click(function(event) {
	    $(".navbar-collapse").toggle('in');
	});
	
	$(".page-scroll").click(function(event) {
	    $(".navbar-collapse").toggle('in');
	});
	
	$(".row").click(function(event) {
	    $(".navbar-collapse").hide();
	});
	
	initMap();
	$.ajax({
		url : "/Frolic/frolic/get",
		type : "get",
		data : {
			permalink : getParameter("permalink")
		},
		success : function(response) {
			response = JSON.parse(response);
			frolicResponse = response;
			console.log(response);
			$.each(response.place, function(index, place) {
				$()
				waypts.push({
					location : place.name + " " + place.address,
					stopover : true
				});
			});
			handleDirections();
			map.setCenter({
				lat : parseFloat(response.centreLat),
				lng : parseFloat(response.centreLon)
			});
			console.log(map);
		},
		error : function(xhr) {
			//Do Something to handle error
		}
	});
});
