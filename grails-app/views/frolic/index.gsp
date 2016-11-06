<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Frolic</title>

<!-- Bootstrap Core CSS -->
<asset:stylesheet href="bootstrap.min.css" />

<!-- Custom CSS -->
<asset:stylesheet href="grayscale.css" />

<!-- Custom Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					<span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
				</button>
				<a class="navbar-brand" href="${createLink(uri:'/')}"> <i
					class="fa fa-play-circle"></i><span
					class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;<span
					class="light">LETS</span> FROLIC
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div
				class="collapse navbar-collapse navbar-right navbar-main-collapse">

				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="#placeMap">MAP</a></li>
					<li><a class="page-scroll" href="#places">PLACES</a></li>
					<li><a class="page-scroll" href="/Frolic/">REDO</a></li>
					<li><a class="page-scroll" href="#share">SHARE</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Intro Header -->

	<header class="intro">
		<div class="intro-body">
			<section id="placeMap" class="content-section text-center">
				<div class="container">
					<div class="row">
						<div id="map"></div>
					</div>
				</div>
			</section>
		</div>
	</header>

	<!-- About Section -->
	<br>
	<br>
	<br>
	<br>
	<br>
    <br>
    <br>
	<section id="empty" class="container content-section text-center">
        <h2>NEAR ${ frolic.location }</h2>
        <br>
        <br>
	</section>
    <g:hiddenField name="lon" value="" />
    <g:hiddenField name="lat" value="" />

	<section id="places" class="container content-section text-center">
		<div class="row" id="placesRow">
	      <g:each in="${ frolic.place.subList(0, frolic.numberOfPlaces) }">
	      <div class="col-md-4">
               <div style="height: 300px" class="thumbnail">
                 <div class="placeOrder">
                    <h1>${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) + 1 }</h1>
                 </div>
                 <img style="border: 1px solid black" src="https://maps.googleapis.com/maps/api/streetview?size=200x100&location=${it.lat},${it.lon}&heading=151.78&pitch=-0.76&key=AIzaSyBPceR651kX-G401Wi-dloiOXOPCta1cvo">
                 <!--  <g:if test="${ it.imageUrl }">
		             <img style="border: 1px solid black" src="${ it.imageUrl }" alt="...">
                 </g:if>
                 <g:else>
                     <div style="height:100px"></div>
                 </g:else>-->
	             <div class="caption">
	               <h6>${ it.name }<br>
	                   ${ it.hits }
	                   <span style="color: #42DCA3; margin-left: -2px;" class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                       ${ it.rating }
                       <span style="color: #42DCA3; margin-left: -2px;" class="glyphicon glyphicon-star" aria-hidden="true"></span>
                       <span id="upvotes-${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) }">${ it.upvotes }</span>                    
                       <span style="color: #42DCA3; margin-left: -2px;" class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
                       <span id="downvotes-${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) }">${ it.downvotes }</span>                    
                       <span style="color: #42DCA3; margin-left: -2px;" class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                   </h6>
	               <p class="placeInfoBox">${ it.address } (${ it.phone })</p>
	               <p>
		               <a href="/Frolic/frolic/start/?permalink=${ frolic.permalink }&placeIdx=${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) }" style="font-size: 12px; margin-top: 5px;" class="btn btn-default" role="button"><span class="glyphicon glyphicon glyphicon-play" aria-hidden="true"></span> Start</a> 
		               <a href="/Frolic/frolic/swap/?permalink=${ frolic.permalink }&placeIdx=${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) }" style="font-size: 12px; margin-top: 5px;" class="btn btn-default" role="button"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Swap</a>
	                   <br>
	                   <a href="#" onclick="upvotePlace(event, '${ frolic.permalink }', '${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) }'); return false;" style="font-size: 12px; margin-top: 5px;" class="btn btn-default" role="button"><span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span> Upvote</a>
                       <a href="#" onclick="downvotePlace(event, '${ frolic.permalink }', '${ frolic.place.subList(0, frolic.numberOfPlaces).indexOf(it) }'); return false;" style="font-size: 12px; margin-top: 5px;" class="btn btn-default" role="button"><span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> Downvote</a>
	               </p>
	             </div>
              </div>
		  </div>
	      </g:each>
		</div>
	</section>

	<!-- Download Section -->
	<section id="share" class="content-section text-center">
		<div class="download-section">
			<div class="container">
				<div class="col-lg-8 col-lg-offset-2">
					<h2>SHARE THIS FROLIC</h2>
					<qrcode:url width="128"/>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container text-center">
			<p style="font-size: 10px;">Copyright &copy; Let's Frolic! 2016</p>
		</div>
	</footer>
		
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-50106353-1', 'auto');
	  ga('send', 'pageview');
	
	</script>

	<!-- jQuery -->
	<asset:javascript src="jquery.js" />

	<!-- Bootstrap Core JavaScript -->
	<asset:javascript src="bootstrap.min.js" />

	<!-- Plugin JavaScript -->
	<asset:javascript src="jquery.easing.min.js" />

	<!-- Custom Theme JavaScript -->
	<asset:javascript src="grayscale.js" />
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPceR651kX-G401Wi-dloiOXOPCta1cvo"></script>

	<asset:javascript src="application.js" />


</body>

</html>
