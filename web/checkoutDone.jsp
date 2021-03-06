<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Bestellung abgeschlossen | Hipster Rental</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">



    </head><!--/head-->

    <body onload="init()">
        <header id="header"><!--header-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="FileZillaImageRessource/logo.png" alt="" />
                                </a>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li id="liAccount"</li>
                                    <li id="liCheckout"></li>
                                    <li id="liShoppingCart"></li>
                                    <li id="liLoginout"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->


        </header><!--/header-->

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Kasse</li>
                    </ol>
                </div><!--/breadcrums-->

                <div class="step-one">
                    <h2 class="heading">Bestellung Abgeschlossen</h2>
                </div>

                <div class="register-req">
                    <p>Ihre Bestellung wird von unseren Sachbearbeitern in Empfang genommen. Sie erhalten eine Nachricht, sobald Ihre Bestellung freigegeben ist.</p>
                </div><!--/register-req-->

                <div class="register-req">
                    Teilen Sie Ihre Bestellung auf Twitter!
                    <form target="_blank" name="tweet" action="https://twitter.com/share" method="get"> 
                        <input type="hidden" name="original_referer" value="http://www.HRC.de"> 
                        <input type="hidden" name="source" value="tweetbutton"> 
                        <input type="hidden" name="url" value="http://www.HRC.de"> 
                        <textarea style="width:430px; height:68px; font-size:18px" type="text"  name="text" maxlength="98">Ich habe soeben bei Hipster Rental bestellt. #HRC</textarea>
                        <button type="submit"><img src="http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/twitter.png" width="25px" alt=''>Tweet this!</button>    
                    </form>
                </div><!--/register-req-->

            </div>
        </section> <!--/#cart_items-->

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>H</span>ipster <span>R</span>ental</h2>
                                <p>Veranstaltungstechnik f�r Schleswig-Holstein</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>Zum Schl�sbeker Moor 50 | 24145 Kiel</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2015 Hipster Rental Corp.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
        function init() {
            isUserLoggedIn();
        }

        function isUserLoggedIn() {
            var user = '<%= session.getAttribute("User")%>'
            if (user !== null && user !== "" && user !== "null") {

                var liLogin = '<li id="liLoginout"><a href="/HipsterRentalCorp/LogoutServlet"><i class="fa fa-lock"></i> Logout</a></li>';
                document.getElementById('liLoginout').innerHTML = liLogin;

                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        var data = xhr.responseText;
                        if (data.indexOf("MitarbeiterNR -") === -1) {

                            var liCheckout = '<li><form  action="/HipsterRentalCorp/LoadCheckoutServlet" method="get"><a href="#" onclick="this.parentNode.submit();"><i class="fa fa-crosshairs"></i> Checkout</a></form></li>';
                            document.getElementById('liCheckout').innerHTML = liCheckout;

                            var liAccount = '<li><a href="Account.jsp"><i class="fa fa-user"></i>' + data + '</a></li>';
                            document.getElementById('liAccount').innerHTML = liAccount;

                            var liShoppingCart = '<li><form  action="/HipsterRentalCorp/LoadShoppingCartServlet" method="get"><a href="#" onclick="this.parentNode.submit();"><i class="fa fa-shopping-cart"></i> Warenkorb</a><form></li>';
                            document.getElementById('liShoppingCart').innerHTML = liShoppingCart;
                        } else {
                            var liCheckout = '<li><a><i class="fa fa-crosshairs"></i> Checkout</a></li>';
                            document.getElementById('liCheckout').innerHTML = liCheckout;

                            var liAccount = '<li><a><i class="fa fa-user"></i>' + data + '</a></li>';
                            document.getElementById('liAccount').innerHTML = liAccount;

                            var liShoppingCart = '<li><a><i class="fa fa-shopping-cart"></i> Warenkorb</a></li>';
                            document.getElementById('liShoppingCart').innerHTML = liShoppingCart;
                        }
                    }
                };
                xhr.open('GET', '/HipsterRentalCorp/GetUserServlet', true);
                xhr.send(null);
            } else {
                var liCheckout = '<li><form  action="/HipsterRentalCorp/LoadCheckoutServlet" method="get"><a href="#" onclick="this.parentNode.submit();"><i class="fa fa-crosshairs"></i> Checkout</a></form></li>';
                document.getElementById('liCheckout').innerHTML = liCheckout;

                var liLogin = '<li id="liLoginout"><a href="Login.jsp"><i class="fa fa-lock"></i> Login</a></li>';
                document.getElementById('liLoginout').innerHTML = liLogin;

                var liAccount = '<li><a href="Login.jsp"><i class="fa fa-user"></i> Konto</a></li>';
                document.getElementById('liAccount').innerHTML = liAccount;

                var liShoppingCart = '<li><form  action="/HipsterRentalCorp/LoadShoppingCartServlet" method="get"><a href="#" onclick="this.parentNode.submit();"><i class="fa fa-shopping-cart"></i> Warenkorb</a><form></li>';
                document.getElementById('liShoppingCart').innerHTML = liShoppingCart;
            }
        }
        
        </script>
    </body>
</html>