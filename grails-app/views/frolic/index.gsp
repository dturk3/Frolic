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
				<a class="navbar-brand" href="#page-top"> <i
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
					<li><a class="page-scroll" href="#places">PLACES</a></li>
					<li><a class="page-scroll" href="#redo">REDO</a></li>
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
			<div class="container">
				<div class="row">
				    <div id="map"></div>
				</div>
			</div>
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
	      <g:each in="${ frolic.place }">
	      <div class="col-md-4">
               <div style="height: 300px" class="thumbnail">
                 <g:if test="${ it.imageUrl }">
		             <img style="border: 1px solid black" src="${ it.imageUrl }" alt="...">
                 </g:if>
                 <g:else>
                     <div style="height:100px"></div>
                 </g:else>
	             <div class="caption">
	               <h6>${ it.name }</h6>
	               <p style="font-size: 14px;">${ it.address }</p>
	               <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	             </div>
              </div>
		  </div>
	      </g:each>
		</div>
	</section>

	<!-- Download Section -->
	<section id="redo" class="content-section text-center">
		<div class="download-section">
			<div class="container">
				<div class="col-lg-8 col-lg-offset-2">
					<h2>Download Grayscale</h2>
					<p>You can download Grayscale for free on the preview page at
						Start Bootstrap.</p>
					<a href="http://startbootstrap.com/template-overviews/grayscale/"
						class="btn btn-default btn-lg">Visit Download Page</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Contact Section -->
	<section id="share" class="container content-section text-center">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>Contact Start Bootstrap</h2>
				<p>Feel free to email us to provide some feedback on our
					templates, give us suggestions for new templates and themes, or to
					just say hello!</p>
				<p>
					<a href="mailto:feedback@startbootstrap.com">feedback@startbootstrap.com</a>
				</p>
				<ul class="list-inline banner-social-buttons">
					<li><a href="https://twitter.com/SBootstrap"
						class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
							<span class="network-name">Twitter</span></a></li>
					<li><a
						href="https://github.com/IronSummitMedia/startbootstrap"
						class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i>
							<span class="network-name">Github</span></a></li>
					<li><a href="https://plus.google.com/+Startbootstrap/posts"
						class="btn btn-default btn-lg"><i
							class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
					</li>
				</ul>
			</div>
		</div>
		<br>
		<br>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container text-center">
			<p>Copyright &copy; Your Website 2014</p>
		</div>
	</footer>

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
