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
        <title>Kategorie anlegen | Hipster Rental</title>
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
                                    <h2>Produkt anlegen</h2>
                                    <form action="/HipsterRentalCorp/AddCategoryServlet" method="post">
                                        <input type="text" name="name" required=true placeholder="Name *"/>
                                        <select id="selectCategory" name="subcategory">
                                        </select> 
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


        function initLogin() {
            var loginForm = "<object type='text/html' data='LoginForm/LoginForm.jsp' width='100%' height='100%'></object>";
            document.getElementById('divLogin').innerHTML = loginForm;
        }

        function loadShoppingCart() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var data = xhr.responseText;
                    document.getElementById('divContent').innerHTML = data;
                }
            };
            xhr.open('GET', '/HipsterRentalCorp/LoadShoppingCartServlet', true);
            xhr.send(null);
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

        /* Retrieves the products within the clicked category and places them in the 'divContent'. */
        function getProducts(categoryNumber) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var data = xhr.responseText;
                    document.getElementById('divContent').innerHTML = data;
                }
            };
            xhr.open('GET', '/HipsterRentalCorp/ProductsByCategoryServlet?categoryNumber=' + categoryNumber, true);
            xhr.send(null);
        }
        function clearShoppingCartForUnregisteredUser() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/HipsterRentalCorp/ClearShoppingCartForUnregisteredUserServlet', true);
            xhr.send(null);
        }


        function loadPackage(packageNumber) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var data = xhr.responseText;
                    document.getElementById('divContent').innerHTML = data;
                }
            };
            xhr.open('GET', '/HipsterRentalCorp/LoadPackageServlet?packageNumber=' + packageNumber, true);
            xhr.send(null);
        }


        /* Methods, invoked from child-pages */

        /**
         * This method loads the user (if still loged in) and is invoked by a childpage.
         * @returns {undefined}
         */
        /*function userStillLogedIn() {
         var xhr = new XMLHttpRequest();
         xhr.onreadystatechange = function () {
         if (xhr.readyState === 4) {
         var data = xhr.responseText;
         document.getElementById('divLogin').innerHTML = data;
         }
         };
         xhr.open('GET', '/HipsterRentalCorp/UserStillLogedInServlet', true);
         xhr.send(null);
         }*/

        /**
         * This method loads the 'registration form' and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadRegistrationForm() {
            var loginForm = "<object type='text/html' data='RegistrationForm/RegistrationForm.jsp' width='100%' height='100%'></object>";
            document.getElementById('divContent').innerHTML = loginForm;
        }

        /**
         * This method loads the 'Welcome' page and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadWelcomePage() {
            var welcome = "<object type='text/html' data='Welcome/WelcomeMain.jsp' width='100%' height='100%'></object>";
            document.getElementById('divContent').innerHTML = welcome;
            initCategory();
        }


        /**
         * This method loads the 'order view' and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadOrderView() {
            var orderView = "<object type='text/html' data='EmployeeOverlay/OrderView.jsp' width='100%' height='100%'></object>";
            document.getElementById('divContent').innerHTML = orderView;
        }
        /**
         * This method loads the 'add product' page and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadAddProduct() {
            var addProduct = "<object type='text/html' data='EmployeeOverlay/AddProduct.jsp' width='100%' height='100%'></object>";
            document.getElementById('divContent').innerHTML = addProduct;
        }

        /**
         * This method loads the 'add package' page and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadAddPackage() {
            var addPackage = "<object type='text/html' data='EmployeeOverlay/AddPackage.jsp' width='100%' height='100%' ></object>";
            document.getElementById('divContent').innerHTML = addPackage;
        }

        /**
         * This method loads the 'add user' page and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadAddUser() {
            var addUser = "<object type='text/html' data='EmployeeOverlay/AddUser.jsp' width='100%' height='100%'></object>";
            document.getElementById('divContent').innerHTML = addUser;
        }

        /**
         * This method loads the 'period' page and is invoked by a childpage.
         * @returns {undefined}
         */
        function loadPeriod() {
            var period = "<object type='text/html' data='Order/Period.jsp' width='100%' height='100%' ></object>";
            document.getElementById('divContent').innerHTML = period;
        }

        function createOrder(from, till) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var data = xhr.responseText;
                    document.getElementById('divContent').innerHTML = data;
                }
            };
            xhr.open('GET', '/HipsterRentalCorp/CreateOrder?from=' + from + "&till=" + till, true);
            xhr.send(null);
        }

        function loadGuest() {
            var period = "<object type='text/html' data='Order/Guest.jsp' width='100%' height='100%' ></object>";
            document.getElementById('divContent').innerHTML = period;
        }

        function validateUser() {
            var user = '<%= session.getAttribute("User")%>';
            if (user !== null && user !== "" && user !== "null") {
                loadPeriod();
            } else {
                loadGuest();
            }
        }
        </script>
    </body>
</html>
