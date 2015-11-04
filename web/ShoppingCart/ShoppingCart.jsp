<%-- 
    Document   : MainWarenkorb
    Created on : 16.10.2015, 18:02:42
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>

            <table>
                <tbody>
                    <tr>
                        <td>
                            <form action="/HipsterRentalCorp/DeleteFromShoppingCartServlet" method="post">  
                                ${requestScope.shoppingCart.getItemsView()}
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
        </div>
    </body>
</html>
