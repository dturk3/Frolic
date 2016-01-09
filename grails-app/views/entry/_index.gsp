<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Frolic</title>

    <!-- Bootstrap Core CSS -->
    <asset:stylesheet href="bootstrap.min.css"/>

    <!-- Custom CSS -->
    <asset:stylesheet href="grayscale.css"/>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
		body {
			background-color: white;
		}
		img {
			position:fixed;
			left: 50%;
			top:  50%;
			/*
			    if, for instance, the image is 64x64 pixels,
			    then "move" it half its width/height to the
			    top/left by using negative margins
			*/
			margin-left: -60px;
			margin-top:  -60px;
			display: none;
		}
    </style>
    <!-- jQuery -->
    <asset:javascript src="jquery.js"/>
    <script>
	    $( document ).ready(function() {
	    	$("img").fadeIn(1000);
	    });
    </script>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <g:form action="geolocate">
        <g:hiddenField name="lon" value="" />
        <g:hiddenField name="lat" value="" />
    </g:form>
    <script>
	    // Try HTML5 geolocation.
	    if (navigator.geolocation) {
	      navigator.geolocation.getCurrentPosition(function(position) {
	        var pos = {
	          lat: position.coords.latitude,
	          lng: position.coords.longitude
	        };
	        $("input[name='lon']").val(pos.lng);
	        $("input[name='lat']").val(pos.lat);
	        $("form").submit();
	      }, function() {
	        // Error geolocating
	      });
	    } else {
	      // Browser doesn't support Geolocation
	    }
    </script>

    <asset:image src="gears.gif"/>

    <!-- Bootstrap Core JavaScript -->
    <asset:javascript src="bootstrap.min.js"/>

    <!-- Plugin JavaScript -->
    <asset:javascript src="jquery.easing.min.js"/>

    <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRngKslUGJTlibkQ3FkfTxj3Xss1UlZDA&sensor=false"></script>

    <!-- Custom Theme JavaScript -->
    <asset:javascript src="grayscale.js"/>

</body>

</html>
