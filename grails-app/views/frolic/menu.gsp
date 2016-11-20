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
<asset:stylesheet href="vert-style.css" />
<asset:stylesheet href="vert-normalize.css" />


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
				<a class="navbar-brand" style="color: white"
					href="${createLink(uri:'/')}"> <i class="fa fa-play-circle"></i><span
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
					<li><a class="page-scroll" href="#placeMap">LIVE</a></li>
					<li><a class="page-scroll" href="#placeMap">FEED</a></li>
					<li><a class="page-scroll" href="#placeMap">DATA</a></li>
					<li><a class="page-scroll" href="#placeMap">BLOG</a></li>
					<li><a class="page-scroll" href="#placeMap">LOGOUT</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Intro Header -->

	<header class="intro">
		<div class="intro-body">
			<section id="menu" class="content-section text-center"></section>
		</div>
	</header>

	<!-- Footer -->
	<footer>
		<div class="container text-center">
			<p style="font-size: 10px;">Copyright &copy; Let's Frolic! 2016</p>
		</div>
	</footer>

	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

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

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPceR651kX-G401Wi-dloiOXOPCta1cvo"></script>

	<asset:javascript src="application.js" />


</body>

</html>
