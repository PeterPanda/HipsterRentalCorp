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
        <table>
            <tbody>
                <tr>
                    <td>
                        Produkte:
                    </td>
                    <td>
                        ${requestScope.shoppingCart.getProduktView()}
                    </td>
                </tr>
                <tr>
                    <td>
                        Pakete:
                    </td>
                    <td>
                        ${requestScope.shoppingCart.getPaketView()}
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
