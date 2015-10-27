<%-- 
    Document   : AddUser
    Created on : 26.10.2015, 15:26:42
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddUser</title>
    </head>
    <body>
        <h1>Benutzer anlegen</h1>
        <form action="/HipsterRentalCorp/AddEmployeeServlet" method="post">  
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
                    <td>Passwort*:</td>
                    <td><input type='text' name='inputPasswort' required="true" maxlength="255"></td>
                </tr>
                <tr>
                    <td>Passwort wiederholen*:</td>
                    <td><input type='text' name='inputPasswortWDH' required="true" maxlength="255"></td>
                </tr>
                <tr>
                    <td><button type="submit">Mitarbeiter anlegen</button></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        </form>
        <p>*Pflichtfeld</p>
    </body>
</html>
