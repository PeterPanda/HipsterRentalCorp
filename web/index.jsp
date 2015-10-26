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
             * This method loads the registration form and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadRegistrationForm() {
                var loginForm = "<object type='text/html' data='RegistrationForm/RegistrationForm.jsp' ></object>";
                document.getElementById('divContent').innerHTML = loginForm;
            }
            /**
             * This method loads the employee navigation and is invoked by a childpage.
             * @returns {undefined}
             */
            function loadEmployeeOverlay() {
                var employeeNavigation = "<object type='text/html' data='EmployeeOverlay/Navigation.jsp' ></object>"
                document.getElementById('divNavigation').innerHTML = employeeNavigation;
              
            }
            

        </script>

    </body>
</html>
