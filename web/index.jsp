<%-- 
    Document   : index
    Created on : 07.10.2015, 10:17:07
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hipster Rental Corp</title>
        <link rel="stylesheet" type="text/css" href="stylesheetMainPage.css">
        <script type="text/javascript" src="javascriptMainPage.js"></script>
    </head>
    <body onload="init()" onbeforeunload="clearShoppingCartForUnregisteredUser();">
        <table id="tableMain">
            <thead>
                <tr>
                    <th id="cellShopName"><h1>Hipster Rental Corp</h1></th>

                    <th>
                        <table id="tableSearchAndLogin">
                            <thead>
                                <tr>
                                    <th id="cellSearch">
                                        <input type="text"
                                               size="40"
                                               id="complete-field"
                                               onkeyup="doCompletion();">
                                        <button id="buttonSearch" type="button" class="btn btn-default">Suche</button>
                                    </th>
                                    <th id="cellLogin">
                                        <div id="divLogin">
                                            <button id="buttonLogin" type="button" class="btn btn-default" onclick="initLogin">Anmelden</button>
                                        </div>
                                    </th>
                                    <th>
                                        <div id="divShoppingCart" onclick="loadShoppingCart();">
                                            <img id="imgShoppingCart" src="http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/shoppingcart.png" alt="shoppingcart" >
                                            <p id="pShoppingCartCount"></p>
                                        </div>
                                    </th>
                                </tr>
                            </thead>
                        </table>

                    </th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <!--<form action="/HipsterRentalCorp/ProductsByCategoryServlet" method="post">-->
                        <div id="divNavigation">
                            Navigation
                        </div>
                        <!--</form>-->
                    </td>
                    <td>
                        <div id="divContent">
                            Content
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <script>
            /* Methods, invoked from child-pages */
            /**
             * This method loads the 'registration form' and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadRegistrationForm() {
                var loginForm = "<object type='text/html' data='RegistrationForm/RegistrationForm.jsp' ></object>";
                document.getElementById('divContent').innerHTML = loginForm;
            }
            /**
             * This method loads the 'employee navigation' and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadEmployeeOverlay() {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        var data = xhr.responseText;
                        document.getElementById('divNavigation').innerHTML = data;
                    }
                };
                xhr.open('GET', '/HipsterRentalCorp/EmployeeNavigationServlet', true);
                xhr.send(null);
            }
            /**
             * This method loads the 'order view' and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadOrderView() {
                var orderView = "<object type='text/html' data='EmployeeOverlay/OrderView.jsp' ></object>";
                document.getElementById('divContent').innerHTML = orderView;
            }
            /**
             * This method loads the 'add product' page and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadAddProduct() {
                var addProduct = "<object type='text/html' data='EmployeeOverlay/AddProduct.jsp'></object>";
                document.getElementById('divContent').innerHTML = addProduct;
            }

            /**
             * This method loads the 'add package' page and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadAddPackage() {
                var addPackage = "<object type='text/html' data='EmployeeOverlay/AddPackage.jsp' ></object>";
                document.getElementById('divContent').innerHTML = addPackage;
            }

            /**
             * This method loads the 'add user' page and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadAddUser() {
                var addUser = "<object type='text/html' data='EmployeeOverlay/AddUser.jsp' ></object>";
                document.getElementById('divContent').innerHTML = addUser;
            }
        </script>

    </body>
</html>
