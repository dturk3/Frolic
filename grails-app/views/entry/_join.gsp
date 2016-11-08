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
	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					<span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"> <i
					class="fa fa-play-circle"></i><span
					class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;<span
					class="light">LETS</span> FROLIC
				</a>
			</div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Login Section -->
	<section id="signin" class="container content-section text-center"
		style="margin-top: -100px;">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>Join Frolic</h2>
				<p>
					Join Frolic to take advantage of some of our <br> coolest
					features. Check back for updates regularly.
				<div style="font-size: 18px;">
					<asset:image style="border: 1px solid white; margin: 5px"
						src="frolic-feature-1.png" />
					<asset:image style="border: 1px solid white; margin: 5px"
						src="frolic-feature-2.png" />
					<asset:image style="border: 1px solid white; margin: 5px"
						src="frolic-feature-3.png" />
					<br> <a id="join-top"></a> <br> Join for FREE today. <br>Be
					part of something exciting in your city, and elsewhere!<br> <br>
				</div>
				</p>
				<div class="frolic-selector">
					<g:if test="${flash.message}">
						<div class="inline-error">
							${flash.message}
						</div>
					</g:if>
					<g:form controller="entry" controller="auth" action="join">
						<g:hiddenField name="lon" value="${ lon }" />
						<g:hiddenField name="lat" value="${ lat }" />

						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
							</span> <input name="displayName" type="text" class="form-control"
								placeholder="Display Name (eg. John Smith)"
								aria-describedby="sizing-addon1"
								value="${ params.displayName }">
						</div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>
							</span> <input name="username" type="text" class="form-control"
								placeholder="Username (eg. jsmith123)"
								aria-describedby="sizing-addon1"
								value="${ params.username }">
						</div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							</span> <input name="email" type="text" class="form-control"
								placeholder="Email address (eg. john.smith@frolic.com)"
								aria-describedby="sizing-addon1"
								value="${ params.email }">
						</div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
							</span> <input name="city" type="text" class="form-control"
								placeholder="Home city (eg. Toronto)"
								aria-describedby="sizing-addon1"
								value="${ params.city }">
						</div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-check" aria-hidden="true"></span>
							</span> <select name="gender" class="form-control"
								aria-describedby="sizing-addon1">
								<option value="M">Male</option>
								<option value="F">Female</option>
								<option value="O">Other</option>
							</select>
						</div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							</span> <input name="password" type="password" class="form-control"
								placeholder="Password" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"> <span
								class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							</span> <input name="confirmPassword" type="password"
								class="form-control" placeholder="Confirm Password"
								aria-describedby="sizing-addon1">
						</div>
						<br>
						<div class="input-group input-group-lg">By joining Frolic,
							you consent to being added to our mailing list, from which you
							may opt out at any time. We will not share your email address
							with third parties.</div>
						<br>
						<br>
						<button type="submit" class="btn btn-custom" aria-label="Fly"
							id="joinButton">
							<div style="font-size: 18px;">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;Sign
								me up!
							</div>
						</button>
					</g:form>
					<br> <br> <br> <br>
				</div>
			</div>
	</section>

	<!-- Contact Section -->
	<section id="contact" class="container content-section text-center">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<!--  <h2>Contact Start Bootstrap</h2>
                <p>Feel free to email us to provide some feedback on our templates, give us suggestions for new templates and themes, or to just say hello!</p>
                <p><a href="mailto:feedback@startbootstrap.com">feedback@startbootstrap.com</a>
                </p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                    </li>
                    <li>
                        <a href="https://plus.google.com/+Startbootstrap/posts" class="btn btn-default btn-lg"><i class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
                    </li>
                </ul>-->
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

	<script>
		$("button").click(function() {
			$("input[name='type']").val($("#type .active").val());
			$("input[name='time']").val($("#time .active").val());
			$("input[name='length']").val($("#length .active").val());
			$("input[name='distance']").val($("#distance .active").val());
		});
	</script>

</body>

</html>
