<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Kasse | Hipster Rental</title>
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
                $('#cost').html(cost + ' €');
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

        </script>
    
</head><!--/head-->

<body>
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
								<li><a href="#" onclick="loadUserData();"><i class="fa fa-user"></i> Konto</a></li>
								<li><a href="#" onclick="loadCheckout();"><i class="fa fa-crosshairs"></i> Kasse</a></li>
								<li><a href="#" onclick="loadShoppingCart();"><i class="fa fa-shopping-cart"></i> Warenkorb</a></li>
								<li><a href="#" onclick="loadLogin();"><i class="fa fa-lock"></i> Login</a></li>
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
                       
			<div class="review-payment">
				<h2>Bestell�bersicht</h2>
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
                                             ${requestScope.order.getItemsView()}
                                             
                                             <tr>
							<td colspan="2">&nbsp;</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tr>
										<td>Warenkorb Summe</td>
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
</body>
</html>tml>