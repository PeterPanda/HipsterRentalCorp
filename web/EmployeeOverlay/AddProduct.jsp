<%-- 
    Document   : AddProduct
    Created on : 26.10.2015, 15:24:51
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddProduct</title>
    </head>
    <body>
        <h1>Produkt anlegen</h1>
        <div>
            <form action="/HipsterRentalCorp/AddProductServlet" method="post">  
                <table>
                    <tbody>
                        <tr>
                            <td>Bezeichnung*:</td>
                            <td><input type='text' name='inputBezeichnung' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Herstellername*:</td>
                            <td><input type='text' name='inputHerstellername' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Beschreibung*:</td>
                            <td><input type='text' name='inputBeschreibung' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Details*:</td>
                            <td><input type='text' name='inputDetails' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Mietzins*:</td>
                            <td><input type='text' name='inputMietzins' required="true" maxlength="10"></td>
                        </tr>
                        <tr>
                            <td>Kategorie*:</td>
                            <td><input type='text' name='inputKategorie' required="true" maxlength="10"></td>
                        </tr>
                        <tr>
                            <td>Alternative:</td>
                            <td><input type='text' name='inputAlternative' maxlength="10"></td>
                        </tr>
                        <tr>
                            <td><button type="submit">Produkt anlegen</button></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <p>*Pflichtfeld</p>
        </div>
    </body>
</html>
