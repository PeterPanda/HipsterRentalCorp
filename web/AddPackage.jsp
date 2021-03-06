<%-- 
    Document   : login
    Created on : 04.11.2015, 15:47:40
    Author     : Jan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Paket anlegen | Hipster Rental</title>
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
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Navigation</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <div id="divNavigation">
                                </div>
                            </div><!--/category-products-->

                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="signup-form"><!--sign up form-->
                                    <h2>Paket anlegen</h2>
                                    <form action="/HipsterRentalCorp/AddPackageServlet" method="post">
                                        <input type="text" name="description" required=true placeholder="Bezeichnung *"/>
                                        <input type="text" name="specification" required=true placeholder="Beschreibung *"/>
                                        <input type="text" name="detail" required=true placeholder="Details *" />
                                        <input type="text" name="rent" required=true placeholder="Mietzins *" />

                                        <select id="selectCategory" name="category" onchange="initProductSelector()">
                                        </select> 

                                        <br>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <select id="selectProduct"></select></td>
                                                    <td>
                                                        <button type="button" onclick="addProductToPackage()">Produkt hinzufügen</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="container">
                                            <div class="table-responsive cart_info">
                                                <table class="table table-condensed" id="productTable">
                                                    <thead>
                                                        <tr class="cart_menu">
                                                            <td class="image">Produkt</td>
                                                            <td class="description">Beschreibung</td>
                                                            <td class="total">Preis</td>
                                                            <td></td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr></tr>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-default">Anlegen</button>
                                    </form>
                                </div><!--/sign up form-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                            function init() {
                                                                initCategory();
                                                                isUserLoggedIn();
                                                                initCategorySelector();
                                                                initProductSelector();
                                                            }
                                                            function addProductToPackage() {
                                                                var data = document.getElementById('selectProduct').value;

                                                                var items = data.split(';');
                                                                var table = document.getElementById("productTable");


                                                                var row = table.insertRow(-1);

                                                                row.id = items[0].split('<br>')[1];

                                                                var cell0 = row.insertCell();
                                                                cell0.classname = "cart_product";
                                                                var cell1 = row.insertCell();
                                                                cell0.classname = "cart_description";
                                                                var cell2 = row.insertCell();
                                                                cell0.classname = "cart_total";
                                                                var cell3 = row.insertCell();
                                                                cell0.classname = "cart_delete";

                                                                cell0.innerHTML = '<img src=\"' + items[1] + '\" width="100px" height="100px">';
                                                                cell1.innerHTML = items[0] + "<input type='hidden' name='products' value='" + row.id + "' />";
                                                                cell2.innerHTML = items[2] + "€";
                                                                cell3.innerHTML = '<a class="cart_quantity_delete" onclick="clearRow(' + row.id + ');"><i class="fa fa-times"></i></a>';
                                                                table.value = table.value + "," + row.id;
                                                            }
                                                            function clearRow(id) {
                                                                document.getElementById("productTable").deleteRow(id);
                                                                document.getElementById("productTable").value = document.getElementById("productTable").value.toString().replace(id, "");
                                                            }
                                                            function initProductSelector() {
                                                                var xhr = new XMLHttpRequest();
                                                                xhr.onreadystatechange = function () {
                                                                    if (xhr.readyState === 4) {
                                                                        var data = xhr.responseText;
                                                                        var items = data.split('|');
                                                                        var select = document.getElementById('selectProduct');
                                                                        select.innerHTML = "";
                                                                        for (var i = 0; i < items.length; i++) {
                                                                            var idandname = items[i].split('§');
                                                                            if (idandname[0] !== "") {
                                                                                var opt = document.createElement('option');
                                                                                opt.value = idandname[0];
                                                                                opt.text = idandname[1];
                                                                                select.add(opt);

                                                                            }
                                                                        }
                                                                    }
                                                                };
                                                                xhr.open('GET', '/HipsterRentalCorp/ProductSelectorServlet?categoryNumber=' + document.getElementById('selectCategory').value, true);
                                                                xhr.send(null);
                                                            }

                                                            function initCategorySelector() {
                                                                var xhr = new XMLHttpRequest();
                                                                xhr.onreadystatechange = function () {
                                                                    if (xhr.readyState === 4) {
                                                                        var data = xhr.responseText;
                                                                        var items = data.split('|');
                                                                        var select = document.getElementById('selectCategory');

                                                                        for (var i = 0; i < items.length; i++) {
                                                                            var idandname = items[i].split(',');
                                                                            if (idandname[0] !== "") {

                                                                                var opt = document.createElement('option');
                                                                                opt.value = idandname[0];
                                                                                opt.text = idandname[1];
                                                                                select.add(opt);
                                                                            }
                                                                        }
                                                                    }
                                                                };
                                                                xhr.open('GET', '/HipsterRentalCorp/CategorySelectorServlet', true);
                                                                xhr.send(null);
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

                                                            /* Initializes the product-category-navigation via servlet */
                                                            function initCategory() {
                                                                var xhr = new XMLHttpRequest();
                                                                xhr.onreadystatechange = function () {
                                                                    if (xhr.readyState === 4) {
                                                                        var data = xhr.responseText;
                                                                        document.getElementById('divNavigation').innerHTML = data;
                                                                    }
                                                                };
                                                                xhr.open('GET', '/HipsterRentalCorp/CategoryServlet', true);
                                                                xhr.send(null);
                                                            }

        </script>
    </body>
</html>
