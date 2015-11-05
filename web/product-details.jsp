<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Details | Hipster Rental</title>
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
                                    <li id="liAccount"></li>
                                    <li><a href="#" onclick="loadCheckout();"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="#" onclick="loadShoppingCart();"><i class="fa fa-shopping-cart"></i> Warenkorb</a></li>
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
                            <h2>Kategorie</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Lichttechnik
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="sportswear" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Beamer </a></li>
                                                <li><a href="">Beleuchtung </a></li>
                                                <li><a href="">Nebelmaschine </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Tontechnik
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="mens" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">CD-Player </a></li>
                                                <li><a href="">Mischpulte</a></li>
                                                <li><a href="">Verstärker</a></li>
                                                <li><a href="">Lautsprecher</a></li>
                                                <li><a href="">Mikrofone</a></li></ul>
                                        </div>
                                    </div>
                                </div>
                                <div id="divNavigation">
                                </div>
                            </div><!--/category-products-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="images/product-details/1.jpg" alt="" />

                                </div>

                            </div>				
                            <div class="col-sm-7">
                                <div class="product-information"><!--product-information-->
                                    <h2>${requestScope.product.getBezeichnung()}</h2>
                                    <p>${requestScope.product.getProduktNR()}</p>
                                    <span>
                                        <span>${requestScope.product.getMietzins()}</span>
                                        <form action="/HipsterRentalCorp/AddProductToShoppingCartServlet" method="post">
                                            <button type="submit" class="btn btn-fefault cart" name="buttonAddToShoppingCart" value="${requestScope.product.getProduktNR()}">Zum Warenkorb hinzufügen</button>
                                        </form>
                                    </span>
                                    <p><b>Zustand:</b> Neu</p>
                                    <p><b>Hersteller:</b> ${requestScope.product.getHersteller()}</p>
                                </div><!--/product-information-->
                            </div>
                        </div><!--/product-details-->

                        <div class="category-tab shop-details-tab"><!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#details" data-toggle="tab">Beschreibung</a></li>
                                    <li><a href="#companyprofile" data-toggle="tab">Spezifikationen</a></li>
                                    <li><a href="#tag" data-toggle="tab">Alternativen</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade" id="details" >
                                    <div class="col-sm-3">
                                        ${requestScope.product.getBeschreibung()}
                                    </div>

                                </div>

                                <div class="tab-pane fade" id="companyprofile" >
                                    <div class="col-sm-3">
                                        ${requestScope.product.getDetails()}
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="tag" >
                                    <div class="col-sm-3">


                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="images/home/gallery3.jpg" alt="" />
                                                    <h2>${requestScope.product.getAlternative().getMietzins()}</h2>
                                                    <p>${requestScope.product.getAlternative().getBezeichnung()}</p>
                                                    <button type="button" onclick="loadAlternative(this.value);" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Zum Warenkorb</button>
                                                </div>
                                            </div>



                                        </div>



                                    </div>

                                </div>

                            </div>
                        </div><!--/category-tab-->

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
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.google.de">HipsterRental</a></span></p>
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
                                                                        var liAccount = '<li><a href="Account.jsp"><i class="fa fa-user"></i>'+data+'</a></li>';
                                                                        document.getElementById('liAccount').innerHTML = liAccount;
                                                                    }
                                                                };
                                                                xhr.open('GET', '/HipsterRentalCorp/GetUserServlet', true);
                                                                xhr.send(null);
                                                            } else {
                                                                var liLogin = '<li id="liLoginout"><a href="Login.jsp"><i class="fa fa-lock"></i> Login</a></li>';
                                                                document.getElementById('liLoginout').innerHTML = liLogin;
                                                                var liAccount = '<li><a href="Login.jsp"><i class="fa fa-user"></i> Konto</a></li>';
                                                                document.getElementById('liAccount').innerHTML = liAccount;
                                                            }
                                                        }

        </script>
    </body>
</html>