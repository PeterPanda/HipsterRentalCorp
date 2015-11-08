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
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Kasse</li>
                    </ol>
                </div><!--/breadcrums-->


                <div class="step-one">
                    <h2 class="heading">Persönliche Informationen</h2>
                </div>
                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-1">
                            <div class="bill-to">
                                <div class="signup-form">
                                    <table>
                                        <tbody>

                                            <tr><td><p>Vorname: </p></td><td><p id="firstName"></p></td></tr>
                                            <tr><td><p>Nachname: </p></td><td><p id="lastName"></p></td></tr>
                                            <tr><td><p>Organisation: </p></td><td><p id="organisation"></p></td></tr>
                                            <tr><td><p>Ort: </p></td><td><p id="place"></p></td></tr>
                                            <tr><td><p>PLZ: </p></td><td><p id="postalCode"></p></td></tr>
                                            <tr><td><p>Stra&szlig;e: </p></td><td><p id="streat"></p></td></tr>
                                            <tr><td><p>Hausnummer: </p></td><td><p id="houseNumber"></p></td></tr>
                                            <tr><td><p>Telefonnummer: </p></td><td><p id="telephone"></p></td></tr>
                                            <tr><td><p>Handynummer: </p></td><td><p id="mobilephone"></p></td></tr>
                                        </tbody>
                                    </table>
                                    <font size="1"><b>* Sie können die Angaben in Ihrem Kundenportal &auml;ndern</b></font>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>

                    <div>
                        <div class="step-one">
                            <h2 class="heading">Wählen Sie den Zeitraum Ihrer Bestellung:</h2>
                        </div>

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
                        <br>
                        <font size="1"><b>* 40% Rabatt ab einschließlich dem 2. Tag.<br>** 20% Rabatt gesamt, wenn mindestens 3 Bestellungen get&auml;tigt.</b></font>
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
                            <tbody id="tbodyOrder">
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
                                    <button class="btn btn-primary" onclick="createOrder()">Kostenpflichtig bestellen</button>
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
                                            var cost = 0;
                                            var from = getFrom();
                                            var till = getTill();

                                            /* Calculate the final costs */
                                            var diff = Math.abs(till - from);
                                            diff = diff / 1000 / 60 / 60 / 24;
                                            diff = Math.ceil(diff);
                                            diff = diff - 1;
                                            cost = diff * rent;
                                            cost = cost * 60;
                                            cost = cost / 100;
                                            cost = cost + rent * 1;

                                            if (${requestScope.ordercount}) {
                                                cost = cost * 0.8;
                                            }
                                            cost = cost.toFixed(2);
                                            $('#cost').html("<p class='cart_total_price'>" + cost + "&euro;</p>");

                                        }

                                        function validateTime() {
                                            var from = document.getElementById('fromDate');
                                            var till = document.getElementById('tillDate');
                                            if (from.value.length === 0 || till.value.length === 0) {
                                                alert("Bitte geben Sie einen korrekten Zeitraum an.");
                                                return false;
                                            }
                                            return true;
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
                                            var user = '<%= session.getAttribute("User")%>';
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

                                                var xhru = new XMLHttpRequest();
                                                xhru.onreadystatechange = function () {
                                                    if (xhru.readyState === 4) {
                                                        var data = xhru.responseText;
                                                        var items = data.split(',');
                                                        document.getElementById('firstName').innerHTML = items[0];
                                                        document.getElementById('lastName').innerHTML = items[1];
                                                        document.getElementById('organisation').innerHTML = items[2];
                                                        document.getElementById('place').innerHTML = items[3];
                                                        document.getElementById('postalCode').innerHTML = items[4];
                                                        document.getElementById('streat').innerHTML = items[5];
                                                        document.getElementById('houseNumber').innerHTML = items[6];
                                                        document.getElementById('telephone').innerHTML = items[7];
                                                        document.getElementById('mobilephone').innerHTML = items[8];
                                                    }
                                                };
                                                xhru.open('GET', '/HipsterRentalCorp/GetUserDataServlet', true);
                                                xhru.send(null);
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

                                        function createOrder() {
                                            var checkCart = document.getElementById('tbodyOrder').getElementsByTagName("tr").length - 3;
                                            if (checkCart > 0) {
                                                var checkTime = validateTime();
                                                if (checkTime === true) {
                                                    var xhr = new XMLHttpRequest();
                                                    xhr.onreadystatechange = function () {
                                                        if (xhr.readyState === 4) {
                                                            var data = xhr.responseText;
                                                            if (data === "success") {
                                                                window.open("checkoutDone.jsp", "_self")
                                                            }
                                                        }
                                                    };
                                                    xhr.open('GET', '/HipsterRentalCorp/CreateOrderServlet?from=' + getFrom() + '&till=' + getTill(), true);
                                                    xhr.send(null);
                                                }
                                            }
                                        }

        </script>
    </body>
</html>