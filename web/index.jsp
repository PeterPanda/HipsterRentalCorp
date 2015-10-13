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
    <body onload="init()">
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
                                </tr>
                            </thead>
                        </table>

                    </th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <!-- <form action="/HipsterRentalCorp/loginServlet" method="post"> -->
                            <div id="divNavigation">
                                test
                            </div>
                        <!-- </form> -->
                    </td>
                    <td id="cellMainContent">2</td>
                </tr>
            </tbody>
        </table>


    </body>
</html>
