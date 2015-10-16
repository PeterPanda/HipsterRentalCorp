<%-- 
    Document   : ViewProduct
    Created on : 12.10.2015, 12:28:15
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewProduct</title>
    </head>
    <body>
        <table>
            <tbody>
                <tr>
                    <td>
                        imm&aumltsch
                        <!-- image here -->
                    </td>
                    <td>
                        ${requestScope.product.getBezeichnung()}
                    </td>
                </tr>
                <tr>
                    <td>
                        Hersteller: 
                    </td>
                    <td>
                        ${requestScope.product.getHersteller()}
                    </td>
                </tr>
                <tr>
                    <td>
                        Beschreibung: 
                    </td>
                    <td>
                        ${requestScope.product.getBeschreibung()}
                    </td>
                </tr>
                <tr>
                    <td>
                        Details: 
                    </td>
                    <td>
                        ${requestScope.product.getDetails()}
                    </td>
                </tr>
                <tr>
                    <td>
                        Mietzins: 
                    </td>
                    <td>
                        ${requestScope.product.getMietzins()}
                    </td>
                </tr>
                <tr>
                    <td>
                        Alternative: 
                    </td>
                    <td>
                        ${requestScope.product.getAlternative()}
                    </td>
                </tr>
            </tbody>
        </table>
        <button>shop dis shit</button>
    </body>
</html>
