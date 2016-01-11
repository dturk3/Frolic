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
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
		.intro {
			display: table;
			width: 100%;
			height: auto;
			padding: 220px 0;
			text-align: center;
			color: #fff;
			background: url(${resource(dir: 'images', file: 'toronto.jpg')}) no-repeat bottom center scroll;
			background-color: #000;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			background-size: cover;
			-o-background-size: cover;
		}
    </style>
    
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <g:form action="geolocate">
        <g:hiddenField name="lon" value="" />
        <g:hiddenField name="lat" value="" />
    </g:form>
    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-play-circle"></i><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;<span class="light">LETS</span> FROLIC
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">GO</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#download">APP</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#download">API</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">CONTACT</a>
                    </li>
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
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">${ city }</h1>
                        <h2 class="intro-text">${ neighbourhood }</h2>
                        <p class="intro-text">Let us choose your adventure.</p>
                        <div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">
						      <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
						  </span>
						  <input type="text" class="form-control" placeholder="Address, city, or postal code" aria-describedby="sizing-addon1">
						</div>
                        
                        <a href="#about" class="btn btn-circle page-scroll">
                            <span style="font-size: 24px" class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- About Section -->
    <section id="about" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Go Frolic!</h2>
                <p>Just a few clicks, and we'll choose what you're doing next.</p>
                <div class="frolic-selector">
	                <table>
	                    <tr>
	                        <th>
	                            <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>&nbsp;WHAT?
	                        </th>
	                        <th>
	                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>&nbsp;WHEN?
	                        </th>
	                        <th>
	                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>&nbsp;HOW LONG?
	                        </th>
	                        <th>
	                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;HOW FAR?
	                        </th>
	                    </tr>
	                    <tr>
	                        <td>
		                        <div id="type" class="btn-group-vertical" role="group" aria-label="...">
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">SURPRISE!</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">DRINK</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">EAT</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">DATE</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">TOURISM</button>
				                </div>
	                        </td>
	                        <td>
	                            <div id="time" class="btn-group-vertical" role="group" aria-label="...">
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">RIGHT NOW!</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">MORNING</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">AFTERNOON</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">EVENING</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">LATE NIGHT</button>
				                </div>
	                        </td>
	                        <td>
	                            <div id="length" class="btn-group-vertical" role="group" aria-label="...">
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">DON'T CARE!</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">ONE-STOP</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">BRIEF</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">TYPICAL</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">MARATHON</button>
				                </div>
	                        </td>
	                        <td>
	                            <div id="distance" class="btn-group-vertical" role="group" aria-label="...">
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">ANYWHERE!</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">WALK</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">BIKE</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">TRANSIT</button>
				                    <button style="width: 120px" type="button" class="btn btn-default btn-selector">DRIVE</button>
				                </div>
	                        </td>
	                    </tr>
	                </table>
                </div>
                <br><br>
                <g:form controller="frolic" action="index" >
                    <g:hiddenField name="location" value=""/>
                    <g:hiddenField name="type" value=""/>
                    <g:hiddenField name="time" value=""/>
                    <g:hiddenField name="length" value=""/>
                    <g:hiddenField name="distance" value=""/>
                    
                    <g:submitButton name="frolic" value="Let's Frolic!" class="btn btn-default"/>
                </g:form>
                
            </div>
        </div>
    </section>

    <!-- Download Section -->
    <section id="download" class="content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2>Download Grayscale</h2>
                    <p>You can download Grayscale for free on the preview page at Start Bootstrap.</p>
                    <a href="http://startbootstrap.com/template-overviews/grayscale/" class="btn btn-default btn-lg">Visit Download Page</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Contact Start Bootstrap</h2>
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
                </ul>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <div id="map"></div>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright &copy; Your Website 2014</p>
        </div>
    </footer>

    <!-- jQuery -->
    <asset:javascript src="jquery.js"/>

    <!-- Bootstrap Core JavaScript -->
    <asset:javascript src="bootstrap.min.js"/>

    <!-- Plugin JavaScript -->
    <asset:javascript src="jquery.easing.min.js"/>

    <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRngKslUGJTlibkQ3FkfTxj3Xss1UlZDA&sensor=false"></script>

    <!-- Custom Theme JavaScript -->
    <asset:javascript src="grayscale.js"/>
    
    <asset:javascript src="application.js"/>

</body>

</html>
