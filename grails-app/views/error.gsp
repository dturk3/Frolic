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
    
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <g:form action="geolocate">
        <g:hiddenField name="lon" value="" />
        <g:hiddenField name="lat" value="" />
    </g:form>

    <!-- Intro Header -->
    <header class="intro">
        <div class="intro-body">
            <div class="container" style="margin-top: 200px; margin-left: auto; margin-right: auto;">
                <div class="row" >
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">Oops!</h1>
                        <h2 class="intro-text">Something is wrong. Please try again.</h2>
                        <p class="intro-text">Let us choose your adventure.</p>
                        <g:form controller="entry" action="index">
                            <button type="submit" class="btn btn-custom" aria-label="Fly" id="changeLocationButton">
                                <div style="font-size: 12px;"><span class="glyphicon glyphicon-plane" aria-hidden="true"></span>&nbsp;&nbsp;Go Back!</div>
                            </button>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </header>

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
    <asset:javascript src="jquery.js"/>

    <!-- Bootstrap Core JavaScript -->
    <asset:javascript src="bootstrap.min.js"/>

    <!-- Plugin JavaScript -->
    <asset:javascript src="jquery.easing.min.js"/>

    <!-- Custom Theme JavaScript -->
    <asset:javascript src="grayscale.js"/>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPceR651kX-G401Wi-dloiOXOPCta1cvo"></script>
    
    <asset:javascript src="application.js"/>
    
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
