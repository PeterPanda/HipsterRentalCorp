<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Bestellen | Hipster Rental</title>
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
                                <a href="index.html"><img src="images/home/logo.png" alt="" />
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
                        <li class="active">Kasse</li>
                    </ol>
                </div><!--/breadcrums-->

                <div class="step-one">
                    <h2 class="heading">Persönliche Informationen</h2>
                </div>

                <div class="register-req">
                    <p>Bitte melden Sie sich mit ihren Accountdaten an oder bestellen Sie als Gast</p>
                </div><!--/register-req-->

                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="shopper-info">
                                <p>Melden sie sich jetzt an</p>
                                <form>
                                    <input type="password" placeholder="E-Mail">
                                    <input type="password" placeholder="Passwort">
                                </form>
                                <a class="btn btn-primary" href="">Anmelden</a>
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <h2 class="or">oder</h2>
                        </div>
                        <div class="col-sm-5 clearfix">
                            <div class="bill-to">
                                <p>Bestellen Sie als Gast</p>
                                <div class="form-one">
                                    <form>
                                        <input type="text" name="companyName" placeholder="Firmenname">
                                        <input type="text" name="firstName" required=true placeholder="Vorname *">
                                        <input type="text" name="lastName" required=true  placeholder="Nachname *">
                                        <input type="text" name="address" required=true placeholder="Addresse *">
                                    </form>
                                </div>
                                <div class="form-two">
                                    <form>
                                        <input type="text" name="postalCode" required=true placeholder="PLZ *">
                                        <input type="text" name="email" required=true placeholder="E-Mail *">
                                        <input type="password" name="password" required=true placeholder="Passwort *">
                                        <input type="text" name="telephone" required=true placeholder="Telefon *">
                                    </form>
                                </div>
                            </div>
                        </div>				
                    </div>
                </div>
                
                <br>
                
                <div>
                    <p>Wählen Sie den Zeitraum Ihrer Bestellung:</p>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    Von:
                                </td>
                                <td>
                                    <input type="date" id="fromDate" onchange="calculateCost()">
                                </td>
                                <td>
                                    <form action="#"> 
                                        <select id="fromTime" onchange="calculateCost()"> 
                                            <option>06:00</option> 
                                            <option>06:30</option> 
                                            <option>07:00</option> 
                                            <option>07:30</option>
                                            <option>08:00</option> 
                                            <option>08:30</option>
                                            <option>09:00</option> 
                                            <option>09:30</option>
                                            <option>10:00</option> 
                                            <option>10:30</option>
                                            <option>11:00</option> 
                                            <option>11:30</option>
                                            <option>12:00</option> 
                                            <option>12:30</option>
                                            <option>13:00</option> 
                                            <option>13:30</option>
                                            <option>14:00</option> 
                                            <option>14:30</option>
                                            <option>15:00</option> 
                                            <option>15:30</option>
                                            <option>16:00</option> 
                                            <option>16:30</option>
                                            <option>17:00</option> 
                                            <option>17:30</option>
                                        </select> 
                                    </form> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Bis:
                                </td>
                                <td>
                                    <input type="date" id="tillDate" onchange="calculateCost()">
                                </td>
                                <td>
                                    <form action="#"> 
                                        <select id="tillTime" onchange="calculateCost()"> 
                                            <option>13:00</option> 
                                            <option>13:30</option>
                                            <option>14:00</option> 
                                            <option>14:30</option>
                                            <option>15:00</option> 
                                            <option>15:30</option>
                                            <option>16:00</option> 
                                            <option>16:30</option>
                                            <option>17:00</option>
                                        </select> 
                                    </form> 
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <div class="review-payment">
                    <h2>Bestell&uuml;bersicht</h2>
                </div>

                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Posten</td>
                                <td class="description">Beschreibung</td>
                                <td class="total">Mietzins</td>
                            </tr>
                        </thead>
                        <tbody>
                        <div id="cart-products">
                            ${requestScope.order.getBestellView()}

                            <tr>
                                <td colspan="2">&nbsp;</td>
                                <td colspan="2">
                                    <table class="table table-condensed total-result">
                                        <tr>
                                            <td>Bestellsumme</td>
                                            <td><p id="cost"></p></td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                            <td>
                                <a class="btn btn-primary" href="">Kostenpflichtig bestellen</a>
                            </td>

                            </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

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
                        <p class="pull-left">Copyright Â© 2015 Hipster Rental Corp.</p>
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
                                            $(function () {
                                                $("#fromDate").datepicker({
                                                    minDate: new Date(),
                                                    dateFormat: "dd.mm.yy"
                                                });
                                            });
                                            $(function () {
                                                $("#tillDate").datepicker({
                                                    minDate: new Date(),
                                                    dateFormat: "dd.mm.yy"
                                                });
                                            });

                                            function calculateCost() {
                                                var rent = '<%= session.getAttribute("rent")%>';

                                                var from = getFrom();
                                                var till = getTill();

                                                /* Calculate the final costs */
                                                var diff = Math.abs(till - from);
                                                diff = diff / 1000 / 60 / 60 / 24;
                                                diff = Math.ceil(diff);
                                                var cost = diff * rent;
                                                cost = cost.toFixed(2);
                                                $('#cost').html("<p class='cart_total_price'>" + cost + "&euro;</p>");
                                            }

                                            function validate() {
                                                var from = document.getElementById('fromDate');
                                                var till = document.getElementById('tillDate');
                                                if (from.value.length === 0 || till.value.length === 0) {
                                                    alert("Bitte geben Sie einen korrekten Zeitraum an.");
                                                } else {
                                                    parent.createOrder(getFrom(), getTill());
                                                }
                                            }

                                            function getFrom() {
                                                /* Get the 'timestamp' attribute for the order */
                                                var fd = $('#fromDate').val();
                                                var ft = $('#fromTime').val();

                                                var splitfromdate = fd.split('.');
                                                var splitfromtime = ft.split(':');

                                                var from = new Date(splitfromdate[2], splitfromdate[1] - 1, splitfromdate[0], splitfromtime[0], splitfromtime[1], '0');
                                                return from;
                                            }
                                            function getTill() {
                                                /* Get the 'timestamp' attributes for the order */
                                                var td = $('#tillDate').val();
                                                var tt = $('#tillTime').val();

                                                var splittilldate = td.split('.');
                                                var splittilltime = tt.split(':');

                                                var till = new Date(splittilldate[2], splittilldate[1] - 1, splittilldate[0], splittilltime[0], splittilltime[1], '0');
                                                return till;
                                            }
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