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

$('.btn-group-horizontal button').click(function()
{
    $(this).parent().children().removeClass('active');
    $(this).addClass('active');
    var avatarId = $(this).attr('id').split('-');
    $('#avatar').attr('value', avatarId[avatarId.length-1]);
});

function updateAvatars(val)
{
	if (val == 'M') {
		$('#male-avatars').show();
		$('#female-avatars').hide();
		$('#male-1').click();
		return;
	}
	if (val == 'F') {
		$('#female-avatars').show();
		$('#male-avatars').hide();
		$('#female-1').click();
		return;
	}
}

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
        	content: '<img style= "float: left; margin-right: 5px; margin-bottom: 5px; border: 1px solid black" src="' + frolicResponse.place[i].imageUrl + '"><h6 style="text-align: left; margin-bottom: 10px;">' + frolicResponse.place[i].name + '</h6>'
	        	+ '<div style="text-align: left; font-size:12px">' + ratingString + '</div>'
	        	+ '<div style="text-align: left; font-size:12px">' + phone + '<br>' + frolicResponse.place[i].address + '</div>'
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
    
    navigator.geolocation.getCurrentPosition(function(position) {
        var myPos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        console.log(myPos);
        var marker = new google.maps.Marker({
          position: myPos,
          visible: true
        });
        marker.setIcon('https://chart.googleapis.com/chart?chst=d_map_spin&chld=d_map_spin&chld=1|0|00AFFF|12|b|me');
        marker.setMap(map);
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
		optimizeWaypoints : false,
		provideRouteAlternatives : false,
		travelMode : google.maps.TravelMode.WALKING
	};
	console.log(request);
	
	directionsService.route(request, function(response, status) {
		var distanceMeters = 0;
		var durationSeconds = 0;
		console.log(status);
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
		}
		
		for (var i = 0; i < response.routes[0].legs.length; i++) {
			var leg = response.routes[0].legs[i];
			distanceMeters += leg.distance.value;
			durationSeconds += leg.duration.value;
		}
		var duration = secondsToTime(durationSeconds + (45 * 60)
				* waypts.length);
		
//		if (status == google.maps.DirectionsStatus.ZERO_RESULTS) {
//			window.location("/frolic/index");
//			return;
//		}

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

function upvotePlace(event, permalink, placeIndex) {
	event.preventDefault();
	$.ajax({
		url : "/Frolic/frolic/upvote/",
		type : "get",
		data : {
			permalink : permalink,
			placeIdx : placeIndex
		},
		success : function(response) {
			console.log(response);
			var votes = parseInt(response.votes);
			
			var currentVotes = parseInt($("#upvotes-" + placeIndex).text());
			$("#upvotes-" + placeIndex).text(currentVotes + votes);
			return false;
		},
		error : function(xhr) {
			//Do Something to handle error
			return false;
		}
	});
	return false;
}

function downvotePlace(event, permalink, placeIndex) {
	event.preventDefault();
	$.ajax({
		url : "/Frolic/frolic/downvote/",
		type : "get",
		data : {
			permalink : permalink,
			placeIdx : placeIndex
		},
		success : function(response) {
			console.log(response);
			var votes = parseInt(response.votes);
			
			var currentVotes = parseInt($("#downvotes-" + placeIndex).text());
			$("#downvotes-" + placeIndex).text(currentVotes + votes);
			return false;
		},
		error : function(xhr) {
			//Do Something to handle error
			return false;
		}
	});
	return false;
}

$(document).ready(function() {
	$(".navbar-toggle").click(function(event) {
	    $(".navbar-collapse").toggle('in');
	});
	
//	$(".page-scroll").click(function(event) {
//	    $(".navbar-collapse").toggle('in');
//	});
	
//	$(".row").click(function(event) {
//	    $(".navbar-collapse").hide();
//	});
//	
	
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
			var placeCount = 0;
			$.each(response.place, function(index, place) {
				if (placeCount >= response.numberOfPlaces) {
					return;
				}
				waypts.push({
					location : place.lat + "," + place.lon,
					stopover : true
				});
				placeCount++;
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

function selectFrolic() {
	setTimeout(function() {
		$(".content-section").fadeOut(250, function(){
			$("#about").removeClass (function (index, css) {
				return (css.match (/frolic-.+\S+/g) || []).join(' ');
			});
            $('#about').addClass('frolic-' + $('button[class*="active"]')[0].attributes.value.nodeValue);
            $('.content-section').fadeIn(250)
        });
	}, 500);
}