<%-- 
    Document   : Guest
    Created on : 02.11.2015, 09:05:41
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest</title>
    </head>
    <body>
        Bestellung als Gast:
        <form action="/HipsterRentalCorp/RegisterGuestServlet" method="post">  
            <div>
                <table>
                    <tbody>
                        <tr>
                            <td>Vorname*:</td>
                            <td><input type='text' name='inputVorname' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Nachname*:</td>
                            <td><input type='text' name='inputNachname' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Email*:</td>
                            <td><input type='text' name='inputEmail' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Organisation:</td>
                            <td><input type='text' name='inputOrganisation' maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Ort*:</td>
                            <td><input type='text' name='inputOrt' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>PLZ*:</td>
                            <td><input type='text' name='inputPLZ' required="true" maxlength="10"></td>
                        </tr>
                        <tr>
                            <td>Strasse*:</td>
                            <td><input type='text' name='inputStrasse' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Hausnummer*:</td>
                            <td><input type='text' name='inputHausnummer' required="true" maxlength="10"></td>
                        </tr>
                        <tr>
                            <td>Telefonnummer*:</td>
                            <td><input type='text' name='inputTelefonnummer' required="true" maxlength="255"></td>
                        </tr>
                        <tr>
                            <td>Handynummer:</td>
                            <td><input type='text' name='inputHandynummer' maxlength="255"></td>
                        </tr>
                        <tr>
                            <td><button type="submit">Bestellung fortsetzen</button></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <p>*Pflichtfeld</p>
            </div>
        </form>
    </body>
</html>
