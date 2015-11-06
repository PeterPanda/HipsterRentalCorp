<%-- 
    Document   : ShoppingCart
    Created on : 16.10.2015, 18:02:42
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Warenkorb | Hipster Rental</title>
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
    </head>
    <body onload="init()">
        <header id="header"><!--header-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="images/home/logo.png" alt="" />
                                    <div class="companyinfo">
                                        <h2><span>H</span>ipster <span>R</span>ental</h2>
                                    </div>
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
                                    <li><div class="search_box pull-right"><input type="text" placeholder="Suche"/></div></li>
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
                        <li><a href="#">Home</a></li>
                        <li class="active">Warenkorb</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Posten</td>
                                <td class="description">Beschreibung</td>
                                <td class="total">Preis</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>

                        <div id="cart-products">
                            ${requestScope.shoppingCart.getItemsView()}
                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Warenkorb Summe <span>${requestScope.shoppingCart.getMietzins()}</span></li>
                            </ul>
                            <!--<a class="btn btn-default update" href="">Kosten Neu berechnen</a>-->
                            <form  action="/HipsterRentalCorp/LoadCheckoutServlet" method="get">
                                <a class="btn btn-default check_out" href="#" onclick="this.parentNode.submit();">Check Out</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#do_action-->

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>H</span>ipster <span>R</span>ental</h2>
                                <p>Veranstaltungstechnik für Schleswig-Holstein</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>Zum Schlüsbeker Moor 50 | 24145 Kiel</p>
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
        <!-- <div>
 
             <table>
                 <tbody>
                     <tr>
                         <td>
                             <form action="/HipsterRentalCorp/DeleteFromShoppingCartServlet" method="post">  
                                 {requestScope.shoppingCart.getItemsView()}
                             </form>
                         </td>
                         <td>
                         </td>
                     </tr>
                     <tr>
                         <td>
                         </td>
                         <td>
                             <button type="button" onclick="parent.validateUser();">Weiter zur Bestellung</button>
                         </td>
                     </tr>
                 </tbody>
             </table>
         </div> -->
    </body> 
</html>
