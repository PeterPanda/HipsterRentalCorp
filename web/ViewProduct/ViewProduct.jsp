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
        <script type="text/javascript" src="ViewProduct.js"></script>
        <title>ViewProduct</title>
    </head>
    <body>
        <div id="divProduct">
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
                            <button value="${requestScope.product.getAlternative()}" onclick="loadAlternative(this.value);">${requestScope.product.getAlternative()}</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <form action="/HipsterRentalCorp/AddProductToShoppingCartServlet" method="post">
                <button type="submit" name="buttonAddToShoppingCart" value="${requestScope.product.getProduktNR()}">Zum Warenkorb hinzufügen</button>
            </form>
        </div>
    </body>
</html>
