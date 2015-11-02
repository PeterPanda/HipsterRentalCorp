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
        <title>ViewPackage</title>
    </head>
    <body>
        <div id="divPackage">
            <table>
                <tbody>

                    <tr>
                        <td>
                            imm&aumltsch
                            <!-- image here -->
                        </td>
                        <td>
                            ${requestScope.loadedPackage.getBezeichnung()}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Beschreibung: 
                        </td>
                        <td>
                            ${requestScope.loadedPackage.getBeschreibung()}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Details: 
                        </td>
                        <td>
                            ${requestScope.loadedPackage.getDetails()}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mietzins: 
                        </td>
                        <td>
                            ${requestScope.loadedPackage.getMietzins()}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Produkte: 
                        </td>
                        <td>
                            ${requestScope.loadedPackage.getProduktView()}
                        </td>
                    </tr>
                </tbody>
            </table>
            <form action="/HipsterRentalCorp/AddPackageToShoppingCartServlet" method="post">
                <button type="submit" name="buttonAddToShoppingCart" value="${requestScope.loadedPackage.getPaketNR()}">Zum Warenkorb hinzufügen</button>
            </form>
        </div>
    </body>
</html>
